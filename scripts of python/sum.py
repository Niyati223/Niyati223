print('printing the sum of current and previous number in the range(10)')
prev_num=0
for i in range(0,10):
  a_sum=prev_num+i
  print('current_num',i,'prev_num',prev_num,'sum:', prev_num+i)
  prev_num=i
