// Lean compiler output
// Module: BenchmarkData49.zNew_abstract_algebra
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
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion___rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion___rarg___lambda__1(lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_p317__main_Gen_ofNat(lean_object*);
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion___rarg(uint8_t, uint8_t, lean_object*);
LEAN_EXPORT lean_object* l_p317__main_Gen_toCtorIdx(uint8_t);
LEAN_EXPORT lean_object* l_p316__transformed_Gen_toCtorIdx___boxed(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p317__main_rels;
LEAN_EXPORT lean_object* l_p317__main_instDecidableEqGen___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p316__transformed_instDecidableEqGen___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_p316__transformed_Gen_toCtorIdx(uint8_t);
LEAN_EXPORT uint8_t l_p316__transformed_Gen_ofNat(lean_object*);
LEAN_EXPORT lean_object* l_p316__transformed_Gen_ofNat___boxed(lean_object*);
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion___rarg___lambda__1___boxed(lean_object*);
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion(lean_object*);
LEAN_EXPORT lean_object* l_p317__main_Gen_toCtorIdx___boxed(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_p317__main_instDecidableEqGen(uint8_t, uint8_t);
LEAN_EXPORT lean_object* l_p316__transformed_heptagonRel;
LEAN_EXPORT lean_object* l_p317__main_Gen_ofNat___boxed(lean_object*);
LEAN_EXPORT lean_object* l_p317__main_Gen_noConfusion___rarg(uint8_t, uint8_t, lean_object*);
LEAN_EXPORT lean_object* l_p317__main_Gen_noConfusion(lean_object*);
LEAN_EXPORT lean_object* l_p317__main_Gen_noConfusion___rarg___boxed(lean_object*, lean_object*, lean_object*);
static lean_object* l_p316__transformed_Gen_noConfusion___rarg___closed__1;
LEAN_EXPORT uint8_t l_p316__transformed_instDecidableEqGen(uint8_t, uint8_t);
LEAN_EXPORT lean_object* l_p316__transformed_Gen_toCtorIdx(uint8_t x_1) {
_start:
{
if (x_1 == 0)
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
else
{
lean_object* x_3; 
x_3 = lean_unsigned_to_nat(1u);
return x_3;
}
}
}
LEAN_EXPORT lean_object* l_p316__transformed_Gen_toCtorIdx___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
lean_dec(x_1);
x_3 = l_p316__transformed_Gen_toCtorIdx(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion___rarg___lambda__1(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
static lean_object* _init_l_p316__transformed_Gen_noConfusion___rarg___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_p316__transformed_Gen_noConfusion___rarg___lambda__1___boxed), 1, 0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion___rarg(uint8_t x_1, uint8_t x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_p316__transformed_Gen_noConfusion___rarg___closed__1;
return x_4;
}
}
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_p316__transformed_Gen_noConfusion___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion___rarg___lambda__1___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_p316__transformed_Gen_noConfusion___rarg___lambda__1(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_p316__transformed_Gen_noConfusion___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_4 = lean_unbox(x_1);
lean_dec(x_1);
x_5 = lean_unbox(x_2);
lean_dec(x_2);
x_6 = l_p316__transformed_Gen_noConfusion___rarg(x_4, x_5, x_3);
return x_6;
}
}
LEAN_EXPORT uint8_t l_p316__transformed_Gen_ofNat(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(0u);
x_3 = lean_nat_dec_eq(x_1, x_2);
if (x_3 == 0)
{
uint8_t x_4; 
x_4 = 1;
return x_4;
}
else
{
uint8_t x_5; 
x_5 = 0;
return x_5;
}
}
}
LEAN_EXPORT lean_object* l_p316__transformed_Gen_ofNat___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = l_p316__transformed_Gen_ofNat(x_1);
lean_dec(x_1);
x_3 = lean_box(x_2);
return x_3;
}
}
LEAN_EXPORT uint8_t l_p316__transformed_instDecidableEqGen(uint8_t x_1, uint8_t x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = l_p316__transformed_Gen_toCtorIdx(x_1);
x_4 = l_p316__transformed_Gen_toCtorIdx(x_2);
x_5 = lean_nat_dec_eq(x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l_p316__transformed_instDecidableEqGen___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = lean_unbox(x_2);
lean_dec(x_2);
x_5 = l_p316__transformed_instDecidableEqGen(x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
static lean_object* _init_l_p316__transformed_heptagonRel() {
_start:
{
return lean_box(0);
}
}
LEAN_EXPORT lean_object* l_p317__main_Gen_toCtorIdx(uint8_t x_1) {
_start:
{
switch (x_1) {
case 0:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
case 1:
{
lean_object* x_3; 
x_3 = lean_unsigned_to_nat(1u);
return x_3;
}
case 2:
{
lean_object* x_4; 
x_4 = lean_unsigned_to_nat(2u);
return x_4;
}
case 3:
{
lean_object* x_5; 
x_5 = lean_unsigned_to_nat(3u);
return x_5;
}
default: 
{
lean_object* x_6; 
x_6 = lean_unsigned_to_nat(4u);
return x_6;
}
}
}
}
LEAN_EXPORT lean_object* l_p317__main_Gen_toCtorIdx___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
lean_dec(x_1);
x_3 = l_p317__main_Gen_toCtorIdx(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_p317__main_Gen_noConfusion___rarg(uint8_t x_1, uint8_t x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_p316__transformed_Gen_noConfusion___rarg___closed__1;
return x_4;
}
}
LEAN_EXPORT lean_object* l_p317__main_Gen_noConfusion(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_p317__main_Gen_noConfusion___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_p317__main_Gen_noConfusion___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_4 = lean_unbox(x_1);
lean_dec(x_1);
x_5 = lean_unbox(x_2);
lean_dec(x_2);
x_6 = l_p317__main_Gen_noConfusion___rarg(x_4, x_5, x_3);
return x_6;
}
}
LEAN_EXPORT uint8_t l_p317__main_Gen_ofNat(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(2u);
x_3 = lean_nat_dec_le(x_2, x_1);
if (x_3 == 0)
{
lean_object* x_4; uint8_t x_5; 
x_4 = lean_unsigned_to_nat(0u);
x_5 = lean_nat_dec_eq(x_1, x_4);
if (x_5 == 0)
{
uint8_t x_6; 
x_6 = 1;
return x_6;
}
else
{
uint8_t x_7; 
x_7 = 0;
return x_7;
}
}
else
{
lean_object* x_8; uint8_t x_9; 
x_8 = lean_unsigned_to_nat(3u);
x_9 = lean_nat_dec_le(x_8, x_1);
if (x_9 == 0)
{
uint8_t x_10; 
x_10 = 2;
return x_10;
}
else
{
uint8_t x_11; 
x_11 = lean_nat_dec_eq(x_1, x_8);
if (x_11 == 0)
{
uint8_t x_12; 
x_12 = 4;
return x_12;
}
else
{
uint8_t x_13; 
x_13 = 3;
return x_13;
}
}
}
}
}
LEAN_EXPORT lean_object* l_p317__main_Gen_ofNat___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = l_p317__main_Gen_ofNat(x_1);
lean_dec(x_1);
x_3 = lean_box(x_2);
return x_3;
}
}
LEAN_EXPORT uint8_t l_p317__main_instDecidableEqGen(uint8_t x_1, uint8_t x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = l_p317__main_Gen_toCtorIdx(x_1);
x_4 = l_p317__main_Gen_toCtorIdx(x_2);
x_5 = lean_nat_dec_eq(x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l_p317__main_instDecidableEqGen___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = lean_unbox(x_2);
lean_dec(x_2);
x_5 = l_p317__main_instDecidableEqGen(x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
static lean_object* _init_l_p317__main_rels() {
_start:
{
return lean_box(0);
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_Aesop(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_BenchmarkData49_zNew__abstract__algebra(uint8_t builtin, lean_object* w) {
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
l_p316__transformed_Gen_noConfusion___rarg___closed__1 = _init_l_p316__transformed_Gen_noConfusion___rarg___closed__1();
lean_mark_persistent(l_p316__transformed_Gen_noConfusion___rarg___closed__1);
l_p316__transformed_heptagonRel = _init_l_p316__transformed_heptagonRel();
l_p317__main_rels = _init_l_p317__main_rels();
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
