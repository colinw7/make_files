#ifndef bool_ops_h
#define bool_ops_h

#define SET_FLAG(v,f)  ((v) |=  (f))
#define RST_FLAG(v,f)  ((v) &= ~(f))
#define TST_FLAG(v,f) (((v) &   (f)) ? true : false)

#define RESET_FLAG(v,f) RST_FLAG(v,f)
#define IS_FLAG(v,f)    TST_FLAG(v,f)

#define SET_BIT(v,n) SET_FLAG(v,1<<(n))
#define RST_BIT(v,n) RST_FLAG(v,1<<(n))
#define TST_BIT(v,n) TST_FLAG(v,1<<(n))

#define RESET_BIT(v,n) RST_BIT(v,n)
#define IS_BIT(v,n)    TST_BIT(v,n)

#endif
