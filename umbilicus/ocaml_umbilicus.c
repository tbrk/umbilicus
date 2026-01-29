
#include "jerry.h"
#include <caml/alloc.h>
#include <caml/memory.h>

CAMLprim value ocaml_umbilicus_climb(value vb)
{
    CAMLparam1(vb);
    CAMLlocal1(vr);

    const char* msg = jerry_climb(Bool_val(vb));
    vr = caml_copy_string(msg);

    CAMLreturn(vr);
}

