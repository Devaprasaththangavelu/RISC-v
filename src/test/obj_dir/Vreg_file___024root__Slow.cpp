// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vreg_file.h for the primary calling header

#include "Vreg_file__pch.h"

void Vreg_file___024root___ctor_var_reset(Vreg_file___024root* vlSelf);

Vreg_file___024root::Vreg_file___024root(Vreg_file__Syms* symsp, const char* namep)
    : __VdlySched{*symsp->_vm_contextp__}
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vreg_file___024root___ctor_var_reset(this);
}

void Vreg_file___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vreg_file___024root::~Vreg_file___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
