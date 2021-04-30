import fs from "fs";
import path from "path";
import process from "process";
import { execSync } from "child_process";
import { EXAMPLES_PATH, getExamples } from "./common.js";

const outputNimFiles = (overwrite = false) => {
    var hadOutputErrors = false;
    if (overwrite === true) {
        console.log("Output files will overwrite existing ones.");
    }

    for (const example of getExamples()) {
        let sourceFile = path.join(example.path, example.name + ".nim");
        let outputFile = path.join(example.path, example.name + ".out");

        if (fs.existsSync(outputFile) && overwrite === false) {
            console.log("Output file for " + example.name + " already exists, skipping.");
            continue;
        }

        // TODO: this is Windows specific
        let exeFile = path.join(example.path, example.name + ".exe");

        try {
            const output = execSync("nim compile --run " + sourceFile);
            fs.writeFileSync(outputFile, "$ nim c -r " + example.name + ".nim\n" + output);
        } catch (e) {
            console.log(e);
            hadOutputErrors = true;
        }

        try {
            fs.rmSync(exeFile);
        } catch (e) {
            // ignored
        }
    }

    if (hadOutputErrors) {
        console.error("Some nim files failed to compile and/or run. Check output above.");
        process.exit(1);
    }
}

export default outputNimFiles;