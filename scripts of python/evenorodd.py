list1=[11,22,34,57,44]
listOdd= []
listEven= []
for num in list1:
  if num%2==0:
    listEven.append(num)
  else:
    listOdd.append(num)
print('list1 :', list1)
print('listEven :',listEven)
print('listOdd :',listOdd)

