import { BUILD_PATH, getExamples } from "./common.js";
import clean from "./clean.js";
import build from "./build.js";
import testNim from "./test.nim.js";
import outputNim from "./output.nim.js";


function main() {
    let steps;
    if (process.argv.length < 3) {
        console.log("No build steps given, defaulting to clean & build.");
        steps = ["clean", "build"];
    } else {
        steps = process.argv[2].split(",");
    }

    if (steps.includes("clean")) {
        clean();
    }

    if (steps.includes("testNim")) {
        testNim();
    }

    if (steps.includes("outputNim")) {
        outputNim(true);
    }

    if (steps.includes("build")) {
        build();
    }
}

main();