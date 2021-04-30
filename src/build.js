import fs from "fs";
import path from "path";
import mdit from "markdown-it";
import hljs from "highlight.js";
import { BUILD_PATH, TEMPLATES_PATH, getExamples, renderTemplateFile } from "./common.js";

const renderBuild = () => {

    // create build folder if it doesnt exist
    console.log("Creating " + BUILD_PATH + " folder.");
    if (!fs.existsSync(BUILD_PATH)) {
        fs.mkdirSync(BUILD_PATH);
    }

    const examples = getExamples();

    renderIndexPage(examples);
    copyAssets();

    for (let index = 0; index < examples.length; index++) {
        const example = examples[index];
        const previous = index > 0 ? examples[index - 1] : null;
        const next = index < examples.length - 1 ? examples[index + 1] : null;

        let chunks = [];
        for (const ef in example.content) {
            const content = example.content[ef];
            if (content != null) {
                chunks = chunks.concat(extractCodeChunks(content, ef));
            }
            // some space between code from different files
            chunks = chunks.concat([{}]);
        }

        renderExamplePage(example, chunks, previous, next);
    }
}

function renderIndexPage(examples) {
    let index = renderTemplateFile(path.join(TEMPLATES_PATH, "index.html"), {
        examples: examples.map(ex => { return { filename: ex.filename, title: ex.title }})
    });
    fs.writeFileSync(path.join(BUILD_PATH, "index.html"), index);
}

function renderExamplePage(example, chunks, previous, next) {
    let rendered = renderTemplateFile(path.join(TEMPLATES_PATH, "example.html"), {
        title: example.title,
        chunks: chunks,
        previous: previous,
        next: next
    });
    fs.writeFileSync(path.join(BUILD_PATH, example.filename), rendered);
}

function extractCodeChunks(sourceFileContent, language) {
    let chunks = [];
    let currentChunk = {
        language: language,
        comment: "",
        code: ""
    };
    for (let line of sourceFileContent.split("\n")) {
        if (line.trim().length === 0) {
            chunks.push(currentChunk);
            currentChunk = {
                language: language,
                comment: "",
                code: ""
            };
            continue;
        }
        if (line.startsWith("# ")) {
            if (line.substr(2).trim().length == 0) {
                currentChunk.comment += "<br />";
            }
            currentChunk.comment += line.substr(1);
        } else {
            if (line.startsWith("#!")) {
                line = "#" + line.substr(2);
            }
            currentChunk.code += line + "\n";
        }
    }
    chunks.push(currentChunk);

    chunks.forEach(function (element) {
        if (element.comment) {
            element.comment = mdit().renderInline(element.comment);
        }
        if (element.code && element.language) {
            if (element.language === "out") {
                // element.code;
            } else {
                element.code = hljs.highlight(element.code, { language: element.language }).value;
            }
        }
    });
    return chunks;
}

function copyAssets() {
    console.log("Copying css files in " + TEMPLATES_PATH + " to " + BUILD_PATH + ".");
    fs.copyFileSync(path.join(TEMPLATES_PATH, "style.css"), path.join(BUILD_PATH, "style.css"));

    console.log("Copying highlight.js theme file to " + BUILD_PATH + ".");
    fs.copyFileSync(path.join("./node_modules/highlight.js/styles/atom-one-light.css"), path.join(BUILD_PATH, "highlight.css"));
}

export default renderBuild;