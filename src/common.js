import fs, { readFile } from "fs";
import path from "path";
import swig from "swig";

export const BUILD_PATH = "public/";
export const EXAMPLES_PATH = "examples/";
export const TEMPLATES_PATH = "templates/";


export function getExamples() {
    console.log("Reading list of examples from examples.txt file...");
    const examplePathsList = fs.readFileSync("examples.txt", { encoding: "UTF-8" })
        .split("\n")
        .map(line => line.trim())
        .filter(Boolean)
        .filter(line => !line.startsWith("-"))
        .map(line => line.split(";"))
        .filter(lineParts => {
            const line = lineParts[0];
            const sourceFileExists = fs.existsSync(path.join(EXAMPLES_PATH, line, line + ".nim"));
            if (!sourceFileExists) {
                console.log("Example '" + line + "' is missing a Nim source file.");
            }
            return sourceFileExists;
        })
        .map(lineParts => {
            const line = lineParts[0];
            const dir = path.join(EXAMPLES_PATH, line)
            const title = path2title(lineParts.length > 1 ? lineParts[1] : lineParts[0])
            return {
                name: line,
                path: dir.toString(),
                title: title,
                filename: title2filename(title) + ".html",
                content: {
                    nim: readFileContents(path.join(dir, line + ".nim")),
                    sh: readFileContents(path.join(dir, line + ".sh")),
                    out: readFileContents(path.join(dir, line + ".out"))
                }
            }
        });

    console.log("... got " + examplePathsList.length + " examples.");
    return examplePathsList;
}

export function renderTemplateFile(filepath, variables) {
    let template = fs.readFileSync(filepath, { encoding: "utf-8" });
    let rendered = swig.render(template, {
        autoescape: false,
        locals: variables
    });
    return rendered;
}

function readFileContents(filepath) {
    if (fs.existsSync(filepath)) {
        return fs.readFileSync(filepath, { encoding: "UTF-8" });
    } else {
        return null;
    }
}

function title2filename(title) {
    // Transforms Hello World to hello_world
    return title
        .replace("/", "_")
        .replace(" ", "_")
        .replace("(", "")
        .replace(")", "")
        .replace(".", "")
        .toLowerCase();
}

function path2title(path) {
    // Transforms hello_world to Hello World
    return path.replace(/^\w/, (c) => c.toUpperCase());
}