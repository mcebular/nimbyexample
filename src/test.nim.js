import fs from "fs";
import path from "path";
import process from "process";
import { execSync } from "child_process";
import { EXAMPLES_PATH, getExamples } from "./common.js";

const testNimFiles = () => {
    var totalExamples = 0;
    var passedExamples = 0;

    for (const example of getExamples()) {
        let sourceFile = path.join(example.path, example.name + ".nim");
        totalExamples++;
        try {
            execSync("nim check " + sourceFile, {
                stdio: "inherit"
            });
            passedExamples++;
        } catch (e) {
            // ignored
        }
    }

    if (totalExamples !== passedExamples) {
        console.error("Some nim file checks failed. Check output above.");
        process.exit(1);
    }

    console.log("Checked " + totalExamples + " files.");
}

export default testNimFiles;