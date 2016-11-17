------------------------------ MODULE DieHardMin ------------------------------

EXTENDS Integers

VARIABLES big, small

Init == /\ big = 0
        /\ small = 0
        
Min(m, n) == IF m < n THEN m ELSE n
        
FillBig == big' = 5 /\ small' = small
EmptyBig == big' = 0 /\ small' = small
BigToSmall == /\ small' = Min(3, big + small)
              /\ big' = big - (small' - small)
FillSmall == small' = 3 /\ big' = big
EmptySmall == small' = 0 /\ big' = big
SmallToBig == /\ big' = Min(5, big + small)
              /\ small' = small - (big' - big)
        
Next == \/ FillBig
        \/ EmptyBig
        \/ BigToSmall
        \/ FillSmall
        \/ EmptySmall
        \/ SmallToBig
        


=============================================================================
\* Modification History
\* Last modified Wed Nov 16 22:58:17 GMT+05:30 2016 by vijay.daniel
\* Created Tue Nov 15 23:37:34 GMT+05:30 2016 by vijay.daniel
