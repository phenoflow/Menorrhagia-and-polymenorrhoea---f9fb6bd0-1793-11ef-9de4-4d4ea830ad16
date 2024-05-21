# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"1573.00","system":"readv2"},{"code":"K592000","system":"readv2"},{"code":"5277.0","system":"readv2"},{"code":"15022.0","system":"readv2"},{"code":"23935.0","system":"readv2"},{"code":"8544.0","system":"readv2"},{"code":"20795.0","system":"readv2"},{"code":"128.0","system":"readv2"},{"code":"20190.0","system":"readv2"},{"code":"100998.0","system":"readv2"},{"code":"20674.0","system":"readv2"},{"code":"93526.0","system":"readv2"},{"code":"812.0","system":"readv2"},{"code":"29459.0","system":"readv2"},{"code":"35691.0","system":"readv2"},{"code":"1077.0","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('menorrhagia-and-polymenorrhoea-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["menorrhagia---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["menorrhagia---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["menorrhagia---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
