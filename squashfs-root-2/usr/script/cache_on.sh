#!/bin/sh

/bin/echo 0 > /proc/tc3162/fe_dyn_qdma_wan_txq_cngst
sys memwl bfb550a4 3c001700
/userfs/bin/hw_nat -N 1
/userfs/bin/qdmamgr_lan set rxratelimit value 0 100000
/userfs/bin/qdmamgr_wan set rxratelimit value 0 100000

