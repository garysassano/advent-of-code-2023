bring fs;
bring regex;

let content = fs.readFile("input");
let lines = content.split("\n");
let var total = 0;

for line in lines {
    // Extract the game ID
    let gameData = line.split(":");
    let gameIdStr = gameData.at(0).trim().split(" ");
    let gameId = std.Number.fromStr(gameIdStr.at(1));

    let var maxRed = 0;
    let var maxGreen = 0;
    let var maxBlue = 0;

    let cubeSets = gameData.at(1).split(";");
    for cubeSet in cubeSets {
        let cubes = cubeSet.trim().split(", ");
        let tempMap = MutMap<num> {};

        for cube in cubes {
            let cubeSplit = cube.split(" ");
            tempMap.set(cubeSplit.at(1),num.fromStr(cubeSplit.at(0)));
        }

        let red = tempMap.tryGet("red") ?? 0;
        let green = tempMap.tryGet("green") ?? 0;
        let blue = tempMap.tryGet("blue") ?? 0;

        if red > maxRed {
            maxRed = red;
        }
        if green > maxGreen {
            maxGreen = green;
        }
        if blue > maxBlue {
            maxBlue = blue;
        }
    }

    // part1
    // if !(maxRed > 12 || maxGreen > 13 || maxBlue > 14) {
    //     total += gameId;
    // }

    // part2
    total += (maxRed*maxGreen*maxBlue);
}

log("{total}");