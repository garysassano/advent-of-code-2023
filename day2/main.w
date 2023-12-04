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

    // Assume the game is possible until proven otherwise
    let var isPossible = true;

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
        if red > 12 || green > 13 || blue > 14 {
            isPossible = false;
            break;
        }
    }

    if (isPossible) {
        total += gameId;
    }
}

log("{total}");