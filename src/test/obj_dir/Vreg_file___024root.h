// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vreg_file.h for the primary calling header

#ifndef VERILATED_VREG_FILE___024ROOT_H_
#define VERILATED_VREG_FILE___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vreg_file__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vreg_file___024root final {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ regfile_tb__DOT__clk;
    CData/*0:0*/ regfile_tb__DOT__we;
    CData/*4:0*/ regfile_tb__DOT__rs1;
    CData/*4:0*/ regfile_tb__DOT__rs2;
    CData/*4:0*/ regfile_tb__DOT__rd;
    CData/*0:0*/ __Vtrigprevexpr___TOP__regfile_tb__DOT__clk__0;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    IData/*31:0*/ regfile_tb__DOT__wd;
    IData/*31:0*/ __VactIterCount;
    IData/*31:0*/ __Vi;
    VlUnpacked<IData/*31:0*/, 32> regfile_tb__DOT__dut__DOT__regs;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggeredAcc;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    VlUnpacked<CData/*0:0*/, 4> __Vm_traceActivity;
    VlDelayScheduler __VdlySched;

    // INTERNAL VARIABLES
    Vreg_file__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vreg_file___024root(Vreg_file__Syms* symsp, const char* namep);
    ~Vreg_file___024root();
    VL_UNCOPYABLE(Vreg_file___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
