#ifndef STD_SHIM_H
#define STD_SHIM_H

// shims for pointers
namespace CPtr {
  template<typename T>
  bool isValid(const T *p) {
   return (p != NULL);
  }

  template<typename T>
  bool isValid(T *p) {
   return (p != NULL);
  }
};

#endif
