import jsony

type
    AnEnum = enum
        A,B,C
    ANewType = object
        prop: string
    AGeneric[T] = object
        gen: T
    MyType = object
        myStr: string
        myInt: int
        myNewType: ANewType
        myGeneric: AGeneric[uint]
        myEnum: AnEnum

proc skipHook*(k: string, v: string): bool =
    result = true

proc skipHook*(k: string, v: int): bool =
    result = true

proc skipHook*(k: string, v: ANewType): bool =
    result = true

proc skipHook*[T](k: string, v: AGeneric[T]): bool =
    result = true

proc skipHook*(k: string, v: AnEnum): bool =
    result = true

let t = MyType(myStr: "foo", myInt: 42, myNewType: ANewType(prop: "bar"), myGeneric: AGeneric[uint](gen: 42), myEnum: AnEnum.C)
doAssert t.toJson() == """{}"""
