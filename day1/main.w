bring fs;
bring regex;

let replaceWords = (s: str): str => {
    let replacements = {
        "one": "one1one",
        "two": "two2two",
        "three": "three3three",
        "four": "four4four",
        "five": "five5five",
        "six": "six6six",
        "seven": "seven7seven",
        "eight": "eight8eight",
        "nine": "nine9nine",
    };

    let var string = s;
    let entries = Json.entries(replacements);

    for e in entries {
        string = string.replaceAll(e.key, std.String.fromJson(e.value));
    }

    return string;
};

let isDigit = (c: str) => {
    return regex.match("\\d", c);
};

let strToArray = (s: str): MutArray<str> => {
    let charArray = MutArray<str>[];

    for i in 0..s.length {
        let c = s.substring(i, i + 1);
        charArray.push(c);
    }

    return charArray;
};

let calibrationValue = (s: str): num => {
    let string = replaceWords(s);
    let var firstDigit: str? = nil;
    let var lastDigit: str? = nil;

    for c in strToArray(string) {
        if (isDigit(c)) {
            if (firstDigit == nil) {
                firstDigit = c;
            }
            lastDigit = c;
        }
    }

    return(std.Number.fromStr("{firstDigit}{lastDigit}"));
};

let content = fs.readFile("input");
let lines = content.split("\n");
let var total = 0;

for line in lines {
    total += calibrationValue(line);
}

log("Total Calibration Value: {total}");
