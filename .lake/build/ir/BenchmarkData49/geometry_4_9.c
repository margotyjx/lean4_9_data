// Lean compiler output
// Module: BenchmarkData49.geometry_4_9
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
extern lean_object* l___private_Mathlib_Data_Real_Basic_0__Real_zero;
LEAN_EXPORT lean_object* l_p158__main_v__coord(lean_object*);
LEAN_EXPORT lean_object* l_p151__main_unitCylinder;
LEAN_EXPORT lean_object* l_p170__main_vol___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p167__main_instTopologicalSpaceRealProjectiveSpace___boxed(lean_object*);
LEAN_EXPORT lean_object* l_p167__main_instTopologicalSpaceRealProjectiveSpace(lean_object*);
LEAN_EXPORT lean_object* l_p170__main_vol(lean_object*, lean_object*);
lean_object* lean_sorry(uint8_t);
lean_object* l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_1069_(lean_object*, lean_object*);
lean_object* l_Matrix_vecEmpty___boxed(lean_object*, lean_object*);
static lean_object* l_p158__main_F___closed__1;
lean_object* l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_719_(lean_object*, lean_object*);
lean_object* l_npowRec___at_Real_commRing___spec__2(lean_object*, lean_object*);
static lean_object* l_p170__main_vol___rarg___closed__1;
lean_object* l_id___rarg___boxed(lean_object*);
lean_object* l_Fin_cases(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p151__main_unitSphere;
LEAN_EXPORT lean_object* l_p167__main_instChartedSpaceEuclideanSpaceRealFinRealProjectiveSpace___boxed(lean_object*);
LEAN_EXPORT lean_object* l_p170__main_vol___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p167__main_instChartedSpaceEuclideanSpaceRealFinRealProjectiveSpace(lean_object*);
LEAN_EXPORT lean_object* l_p158__main_u__coord(lean_object*);
LEAN_EXPORT lean_object* l_p158__main_F(lean_object*, lean_object*);
lean_object* l_Matrix_vecCons___rarg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_WithTop_recTopCoe___rarg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p158__main_F___boxed(lean_object*, lean_object*);
static lean_object* _init_l_p151__main_unitCylinder() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p151__main_unitSphere() {
_start:
{
return lean_box(0);
}
}
static lean_object* _init_l_p158__main_F___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_Matrix_vecEmpty___boxed), 2, 1);
lean_closure_set(x_1, 0, lean_box(0));
return x_1;
}
}
LEAN_EXPORT lean_object* l_p158__main_F(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_3 = lean_unsigned_to_nat(0u);
lean_inc(x_1);
x_4 = lean_apply_1(x_1, x_3);
x_5 = lean_unsigned_to_nat(2u);
lean_inc(x_4);
x_6 = l_npowRec___at_Real_commRing___spec__2(x_5, x_4);
x_7 = lean_unsigned_to_nat(1u);
x_8 = lean_apply_1(x_1, x_7);
lean_inc(x_8);
x_9 = l_npowRec___at_Real_commRing___spec__2(x_5, x_8);
x_10 = l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_719_(x_6, x_9);
x_11 = l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_1069_(x_4, x_8);
x_12 = l_p158__main_F___closed__1;
x_13 = lean_alloc_closure((void*)(l_Matrix_vecCons___rarg___boxed), 4, 3);
lean_closure_set(x_13, 0, x_3);
lean_closure_set(x_13, 1, x_11);
lean_closure_set(x_13, 2, x_12);
x_14 = l_Fin_cases(x_7, lean_box(0), x_10, x_13, x_2);
lean_dec(x_10);
return x_14;
}
}
LEAN_EXPORT lean_object* l_p158__main_F___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_p158__main_F(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_p158__main_u__coord(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_unsigned_to_nat(0u);
x_3 = lean_apply_1(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_p158__main_v__coord(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_unsigned_to_nat(1u);
x_3 = lean_apply_1(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_p167__main_instTopologicalSpaceRealProjectiveSpace(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = 0;
x_3 = lean_sorry(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_p167__main_instTopologicalSpaceRealProjectiveSpace___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_p167__main_instTopologicalSpaceRealProjectiveSpace(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_p167__main_instChartedSpaceEuclideanSpaceRealFinRealProjectiveSpace(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = 0;
x_3 = lean_sorry(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_p167__main_instChartedSpaceEuclideanSpaceRealFinRealProjectiveSpace___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_p167__main_instChartedSpaceEuclideanSpaceRealFinRealProjectiveSpace(x_1);
lean_dec(x_1);
return x_2;
}
}
static lean_object* _init_l_p170__main_vol___rarg___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_id___rarg___boxed), 1, 0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_p170__main_vol___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_3 = lean_ctor_get(x_1, 1);
lean_inc(x_3);
lean_dec(x_1);
x_4 = lean_apply_1(x_3, lean_box(0));
x_5 = l___private_Mathlib_Data_Real_Basic_0__Real_zero;
x_6 = l_p170__main_vol___rarg___closed__1;
x_7 = l_WithTop_recTopCoe___rarg(x_5, x_6, x_4);
return x_7;
}
}
LEAN_EXPORT lean_object* l_p170__main_vol(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_alloc_closure((void*)(l_p170__main_vol___rarg), 2, 0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_p170__main_vol___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_p170__main_vol(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_Aesop(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_BenchmarkData49_geometry__4__9(uint8_t builtin, lean_object* w) {
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
l_p151__main_unitCylinder = _init_l_p151__main_unitCylinder();
l_p151__main_unitSphere = _init_l_p151__main_unitSphere();
l_p158__main_F___closed__1 = _init_l_p158__main_F___closed__1();
lean_mark_persistent(l_p158__main_F___closed__1);
l_p170__main_vol___rarg___closed__1 = _init_l_p170__main_vol___rarg___closed__1();
lean_mark_persistent(l_p170__main_vol___rarg___closed__1);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
