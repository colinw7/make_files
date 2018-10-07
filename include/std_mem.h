#define new(t) ((t *) calloc(1,sizeof(t)))
#define newN(n, t) ((t *) calloc((unsigned int)(n),sizeof(t)))
#define renewN(m,n,t) ((m) = ((t *) realloc(m,(n)*sizeof(t))))

#ifndef strndup
# define strndup(s,n) (strncpy((char *) calloc(n + 1,sizeof(char)),s,n))
#endif

#define memdup(mem,type)\
  (memcpy(calloc(1,sizeof(type)),mem,sizeof(type)))
#define memndup(mem,n,type)\
  (memcpy(calloc((unsigned int)(n),sizeof(type)),mem,(n)*sizeof(type)))

#define free_array(a,n) \
  do { int i; for (i = 0; i < ((int) (n)); i++) \
    free((a)[i]); free(a); } while(0)

#define mem_zero(m) memset(&(m),0,sizeof(m))
