// Lean compiler output
// Module: BenchmarkData49.fourier_analysis_4_9
// Imports: Init Mathlib Aesop
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
LEAN_EXPORT lean_object* l_p96__main_top;
LEAN_EXPORT lean_object* l_p97__main_left;
LEAN_EXPORT lean_object* l_p96__main_bottom;
LEAN_EXPORT lean_object* l_p96__main_right;
lean_object* l_Nat_cast___at_Real_instNatCast___spec__2(lean_object*);
lean_object* l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_906_(lean_object*);
LEAN_EXPORT lean_object* l_p97__main_right;
LEAN_EXPORT lean_object* l_p96__main_left;
lean_object* l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_1069_(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p120__main_mesaFun__kammler27(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p97__main_top;
LEAN_EXPORT lean_object* l_p97__main_bottom;
LEAN_EXPORT lean_object* l_p97__main__u03a9;
LEAN_EXPORT lean_object* l_p120__main_Mkf__kammler27(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p96__main__u03a9;
static lean_object* _init_l_p96__main__u03a9() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p96__main_left() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p96__main_right() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p96__main_bottom() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p96__main_top() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p97__main__u03a9() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p97__main_left() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p97__main_right() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p97__main_bottom() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p97__main_top() {
_start:
{
return lean_box(0);
}
}
LEAN_EXPORT lean_object* l_p120__main_mesaFun__kammler27(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_5 = l_Nat_cast___at_Real_instNatCast___spec__2(x_3);
lean_inc(x_5);
x_6 = l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_906_(x_5);
x_7 = lean_apply_4(x_1, x_4, x_6, x_5, x_2);
return x_7;
}
}
LEAN_EXPORT lean_object* l_p120__main_Mkf__kammler27(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5) {
_start:
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; 
lean_inc(x_5);
x_6 = l_p120__main_mesaFun__kammler27(x_1, x_2, x_4, x_5);
x_7 = lean_apply_1(x_3, x_5);
x_8 = l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_1069_(x_6, x_7);
return x_8;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_Aesop(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_BenchmarkData49_fourier__analysis__4__9(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Aesop(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_p96__main__u03a9 = _init_l_p96__main__u03a9();
l_p96__main_left = _init_l_p96__main_left();
l_p96__main_right = _init_l_p96__main_right();
l_p96__main_bottom = _init_l_p96__main_bottom();
l_p96__main_top = _init_l_p96__main_top();
l_p97__main__u03a9 = _init_l_p97__main__u03a9();
l_p97__main_left = _init_l_p97__main_left();
l_p97__main_right = _init_l_p97__main_right();
l_p97__main_bottom = _init_l_p97__main_bottom();
l_p97__main_top = _init_l_p97__main_top();
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
