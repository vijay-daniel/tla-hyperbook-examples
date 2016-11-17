------------------------------ MODULE DieHardMinExtended ------------------------------

EXTENDS Integers

VARIABLES big, small

TypeOk == /\ big \in 0..5
          /\ small \in 0..3

Init == /\ big = 0
        /\ small = 0
        
Min(m, n) == IF m < n THEN m ELSE n
        
FillBig == big' = 5 /\ small' = small
EmptyBig == big' = 0 /\ small' = small
BigToSmall == 
   LET   poured == Min(big, 3 - small) 
   IN    /\ small' = small + poured
         /\ big' = big - poured
FillSmall == small' = 3 /\ big' = big
EmptySmall == small' = 0 /\ big' = big
SmallToBig == 
   LET   poured == Min(small, 5 - big)
   IN    /\ big' = big + poured
         /\ small' = small - poured
        
Next == \/ FillBig
        \/ EmptyBig
        \/ BigToSmall
        \/ FillSmall
        \/ EmptySmall
        \/ SmallToBig


=============================================================================
\* Modification History
\* Last modified Wed Nov 16 23:08:13 GMT+05:30 2016 by vijay.daniel
\* Created Tue Nov 15 23:37:34 GMT+05:30 2016 by vijay.daniel
