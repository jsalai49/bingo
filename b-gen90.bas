color 15,0:randomize:input "Sheets:";c:if c=0:stop:fi
f0=freefile:open "tick90sr.txt" for output as #f0
f1=freefile:open "sheet-sr.txt" for output as #f1
f2=freefile:open "sheet-m5.csv" for output as #f2
f3=freefile:open "tick90m5.csv" for output as #f3
f4=freefile:open "tick90m6.csv" for output as #f4
f5=freefile:open "sheet-m6.csv" for output as #f5
f6=freefile:open "tick90k5.txt" for output as #f6
f7=freefile:open "tick90k6.txt" for output as #f7
t=",":tt=ticks:z="F1":for i=2 to 162:z+=",F"+i:next
?#f2,z:?#f4,left(z,62):?#f3,left(z,98):?#f5,left(z,431)
s=[0,1,2,0,1,0,1,0,2,0,2,1,2,1,2]
while c:c--:if c%100=0:?c:fi
  dim u,v:e=[u,u,u,u,u,u]:a=[6,6,6,6,6,6]:m=9
  while m:m--:dim q:n=0:d=[0,1,2,3,4,5]:j=4+(m=8)
    for i=0 to 5:if a(i)>m:d << i:a(i)--:j--
    elif a(i):q << i:n++:fi:next
    while n>j:delete q,rnd*n\1:n--:wend
    for i in q:d << i:a(i)--:next
    n=len(d):k=10*m:q=[1,2,3,4,5,6,7,8,9,0,10]
    while n
      j=rnd*n\1:n--:e(d(n)) << k+q(j):q(j)=q(n)
    wend
  wend
  for k=0 to 5
    d=e(k):sort d:dim b(1,8),r(2,8),w,x,y:b(1,8)=d(14)
    n=8:i=14
    while i
      i--:j=d(i):if j\10=n:b(0,n)=j:p=b(1,n)
      o=10000*(j+p-20*n)+n:w << o+10*j,o+10*p
      else:n--:b(1,n)=j:fi
    wend
    for n=0 to 8
      if !b(0,n):w << 1010*b(1,n)-9999*n:fi
    next
    sort w
    for i=0 to 14
      j=w(i)%1000:g=j%10:j=j\10:r(s(i),g)=j
    next
    join d,t,z:e(k)=z:?#f0,z
    for j in b:if j:x << j:else:j="":fi:y << j:next
    join x,t,z:?#f7,z:join y,t,z:?#f4,z:u << z:dim x,y
    for j in r:if j:x << j:else:j="":fi:y << j:next
    join x,t,z:?#f6,z:join y,t,z:?#f3,z:v << z
  next
  join v,t,z:?#f2,z:join u,t,z:?#f5,z:join e,t,z:?#f1,z
wend
?"Finished:";(ticks-tt)/1000;" s"