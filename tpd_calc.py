NOT_LH = 10
NOT_HL = 8
OR_LH = 4
OR_HL = 4
XOR_LH = 7
XOR_HL = 5

def mux2(d0, d1, sel):
    return d0 if sel == 0 else d1

def calc_path_tpd(path,out_change,not_lh, not_hl, or_lh, or_hl, xor_lh, xor_hl):
    total_tpd = 0
    change = out_change
    for mod in path[::-1]:
        if mod == "or":
                total_tpd += or_lh if change == 1 else or_hl
                # same change, no need for update
        elif mod == "xor":
                raise Exception("not supported")
        elif mod == "not":
                total_tpd += not_lh if change == 1 else not_hl
                change = 1 - change
        else:
            raise Exception("not supported")
    return total_tpd

def calc_mux2_tpd():
    tab = []

    paths_tab = [
        [["or","not","or","not"]],
        [["or","not","or","not"]],
        [["or","not","or","not"],["not","or","not","or","not"]]
    ]

    for change_idx in range(0,3):
        for sel in range(0,2):
            for d1 in range(0,2):
                for d0 in range(0,2):
                    vals = [d0,d1,sel]
                    
                    prev_vals = list(vals)
                    prev_vals[change_idx] = 1-vals[change_idx]
                    
                    prev = mux2(*prev_vals)
                    next = mux2(*vals)
                    
                    if (prev != next):
                        paths = paths_tab[change_idx]
                        for path in paths:
                            tpd = calc_path_tpd(path,next,NOT_LH,NOT_HL,OR_LH,OR_HL,XOR_LH,XOR_HL)
                            tab.append((change_idx, d0, d1, sel, prev, next, path, tpd))
                        
    return tab

def print_tpd_tab(tpd_tab):
    for record in tpd_tab:
        idx = record[0]
        str_vals = list(map(str,record[1:4]))
        changed_val = record[1:4][idx]
        str_vals[idx] = f"{1-changed_val}->{changed_val}"
        d0 = str_vals[0]
        d1 = str_vals[1]
        sel = str_vals[2]
        path = f"{'->'.join(record[6])}"
        print(f"d0: {d0}, d1: {d1}, sel: {sel}, prev: {record[4]}, next: {record[5]}, path: {path},tpd: {record[7]}")

def main():

    tpd_tab = calc_mux2_tpd()
    print_tpd_tab(tpd_tab)

    return


if __name__ == "__main__":
    main()