randomize:t=",":input "Tickets: ";p:if p=0:stop:fi
f1=freefile:open "ticketsr.txt" for output as #f1
f2=freefile:open "ticketk5.txt" for output as #f2
f3=freefile:open "ticketk6.txt" for output as #f3
f4=freefile:open "ticketm5.csv" for output as #f4
f5=freefile:open "ticketm6.csv" for output as #f5
ttt=ticks:s=[0,1,2,0,1,0,1,0,2,0,2,1,2,1,2]:z="F1"
for i=2 to 27:z=z+",F"+i:next:?#f5,left(z,62):?#f4,z
while p:p--:if p%100=0:?p:fi
  dim d,w,x,y,b(1,8),r(2,8):a=[0,1,2,3,4,5,6,7,8]:n=9
  while n
    l=rnd*n\1:n--:m=a(l):a(l)=a(n):k=10-(m=0)+(m=8)
    g=10*m:j=g+rnd*k\1+(m=0):d << j:if n<3:b(1,m)=j
    w << 1010*j-9999*m:else:repeat:o=g+rnd*k\1+(m=0)
    until o<>j:k=10000*(j+o-20*m)+m:w << k+10*j,k+10*o
    k=(o>j):b(k,m)=o:b(!k,m)=j:d << o:fi
  wend
  sort d:sort w:for i=0 to 14:j=w(i)%1000:g=j%10:j=j\10
  r(s(i),g)=j:next:join d,t,z:?#f1,z
  for j in b:if j:x << j:else:j="":fi:y << j:next
  join x,t,z:?#f3,z:join y,t,z:?#f5,z:dim x,y
  for j in r:if j:x << j:else:j="":fi:y << j:next
  join x,t,z:?#f2,z:join y,t,z:?#f4,z
wend:?"Finished:";(ticks-ttt)/1000;" s"
