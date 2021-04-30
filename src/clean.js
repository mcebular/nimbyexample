import fs from "fs";
import { BUILD_PATH } from "./common.js";

const cleanBuild = () => {
    // remove all generated file in build path
    if (fs.existsSync(BUILD_PATH)) {
        console.log("Removing " + BUILD_PATH + " folder.");
        fs.rmdirSync(BUILD_PATH, { recursive: true });
    }
}

export default cleanBuild;