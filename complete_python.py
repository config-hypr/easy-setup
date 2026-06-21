# dic={"samples": [10,20,30]}
# sm=0
# for i in dic:
#     for j in dic[i]:
#         sm+=j
# print(sm)

# def encrypt(msg):
#     try:
#         return msg[::-1]
#     except:
#        print("fail")
# print(encrypt("secret"))

# def greet(name):
#     return "Good Morning" + " " + name
# print(greet("sufiyan"))

# def even_odd_(lst):
#     print("\n" + "-" * 40)
#     print("\n", f" list : {lst} ")
#     print("\n" + "-" * 40)
#     for i in lst:
#         if i%2==0:print("\n", f"# ({i}) is even")
#         else:print("\n", f"# ({i}) is odd")
#     return
# even_odd_([0,1,2,3])

#Data classification --> Topper gause from a dic of students 
# def score(dic):
#     for i in dic:
#         max_mark=sum(dic[i])
#         name=i
#         for j in dic:
#             print("\n", f"({j}) --> {(sum(dic[j]) * 100) / 500}") 
#             if sum(dic[j])>max_mark:
#                 max_mark=sum(dic[j])
#                 name=j
#         break
#     return print("\n", "-" * 40, "\n", f"({name}) has scored highest marks ", "\n",  "-" * 40)
# 
# score({
#     "rishabh" : [98,92,91,96,98],
#     "sufiyan" : [100,100,100, 100,100],
#     "farman"  : [84,87,92,88,89],
#     "Atul"    : [84,82,72,78,77]
# })


# f = open("txt01.txt")
# data1 = f.readline()
# data2 = f.readline()
# print(data1)
# print(data2)
# f.close()

# with open("txt01.txt") as f:
#     print(f.read())

# with open("poem.txt") as f:
#     c = f.read()
#     if "twinkle" in c: print("word is here")
#     else: print("none")


