single = Category.create(name: "単頭ペン")
double = Category.create(name: "双頭ペン")

# 単頭ペン
single1 = single.children.create(name: "Dr.GRIP")
single2 = single.children.create(name: "楽ボ mod 系統")
single3 = single.children.create(name: "G-3 mod 系統")
single4 = single.children.create(name: "RSVP 系統")
single5 = single.children.create(name: "その他")

# 双頭ペン
double1 = double.children.create(name: "ロングプレイカラー mod 系統")
double2 = double.children.create(name: "Ballsign mod 系統")
double3 = double.children.create(name: "Dr.KT 系統")
double4 = double.children.create(name: "エンボス mod 系統")
double5 = double.children.create(name: "水性カラーペン mod 系統")
double6 = double.children.create(name: "SWEET DROP mod 系統")
double7 = double.children.create(name: "com-ssa mod 系統")
double8 = double.children.create(name: "Buster CYL 系統")
double9 = double.children.create(name: "その他")

