// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vreg_file.h for the primary calling header

#include "Vreg_file__pch.h"

VL_ATTR_COLD void Vreg_file___024root___eval_initial__TOP(Vreg_file___024root* vlSelf);
VlCoroutine Vreg_file___024root___eval_initial__TOP__Vtiming__0(Vreg_file___024root* vlSelf);
VlCoroutine Vreg_file___024root___eval_initial__TOP__Vtiming__1(Vreg_file___024root* vlSelf);

void Vreg_file___024root___eval_initial(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval_initial\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vreg_file___024root___eval_initial__TOP(vlSelf);
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    Vreg_file___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    Vreg_file___024root___eval_initial__TOP__Vtiming__1(vlSelf);
}

VlCoroutine Vreg_file___024root___eval_initial__TOP__Vtiming__0(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval_initial__TOP__Vtiming__0\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.regfile_tb__DOT__clk = 0U;
    vlSelfRef.regfile_tb__DOT__we = 0U;
    vlSelfRef.regfile_tb__DOT__rs1 = 0U;
    vlSelfRef.regfile_tb__DOT__rs2 = 0U;
    vlSelfRef.regfile_tb__DOT__rd = 0U;
    vlSelfRef.regfile_tb__DOT__wd = 0U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "reg_tb.v", 
                                         58);
    vlSelfRef.regfile_tb__DOT__we = 1U;
    vlSelfRef.regfile_tb__DOT__rd = 1U;
    vlSelfRef.regfile_tb__DOT__wd = 0x00000064U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "reg_tb.v", 
                                         65);
    vlSelfRef.regfile_tb__DOT__rd = 2U;
    vlSelfRef.regfile_tb__DOT__wd = 0x000000c8U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "reg_tb.v", 
                                         72);
    vlSelfRef.regfile_tb__DOT__we = 0U;
    vlSelfRef.regfile_tb__DOT__rs1 = 1U;
    vlSelfRef.regfile_tb__DOT__rs2 = 2U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "reg_tb.v", 
                                         81);
    vlSelfRef.regfile_tb__DOT__we = 1U;
    vlSelfRef.regfile_tb__DOT__rd = 0U;
    vlSelfRef.regfile_tb__DOT__wd = 0x000003e7U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "reg_tb.v", 
                                         89);
    vlSelfRef.regfile_tb__DOT__we = 0U;
    vlSelfRef.regfile_tb__DOT__rs1 = 0U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "reg_tb.v", 
                                         96);
    VL_FINISH_MT("reg_tb.v", 99, "");
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    co_return;
}

VlCoroutine Vreg_file___024root___eval_initial__TOP__Vtiming__1(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval_initial__TOP__Vtiming__1\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (VL_LIKELY(!vlSymsp->_vm_contextp__->gotFinish())) {
        co_await vlSelfRef.__VdlySched.delay(0x0000000000001388ULL, 
                                             nullptr, 
                                             "reg_tb.v", 
                                             37);
        vlSelfRef.regfile_tb__DOT__clk = (1U & (~ (IData)(vlSelfRef.regfile_tb__DOT__clk)));
    }
    co_return;
}

void Vreg_file___024root___eval_triggers_vec__act(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval_triggers_vec__act\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                    ((vlSelfRef.__VdlySched.awaitingCurrentTime() 
                                                      << 1U) 
                                                     | ((IData)(vlSelfRef.regfile_tb__DOT__clk) 
                                                        & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__regfile_tb__DOT__clk__0))))));
    vlSelfRef.__Vtrigprevexpr___TOP__regfile_tb__DOT__clk__0 
        = vlSelfRef.regfile_tb__DOT__clk;
}

bool Vreg_file___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void Vreg_file___024root___nba_sequent__TOP__0(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___nba_sequent__TOP__0\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VdlyVal__regfile_tb__DOT__dut__DOT__regs__v0;
    __VdlyVal__regfile_tb__DOT__dut__DOT__regs__v0 = 0;
    CData/*4:0*/ __VdlyDim0__regfile_tb__DOT__dut__DOT__regs__v0;
    __VdlyDim0__regfile_tb__DOT__dut__DOT__regs__v0 = 0;
    CData/*0:0*/ __VdlySet__regfile_tb__DOT__dut__DOT__regs__v0;
    __VdlySet__regfile_tb__DOT__dut__DOT__regs__v0 = 0;
    // Body
    __VdlySet__regfile_tb__DOT__dut__DOT__regs__v0 = 0U;
    if (((IData)(vlSelfRef.regfile_tb__DOT__we) & (0U 
                                                   != (IData)(vlSelfRef.regfile_tb__DOT__rd)))) {
        __VdlyVal__regfile_tb__DOT__dut__DOT__regs__v0 
            = vlSelfRef.regfile_tb__DOT__wd;
        __VdlyDim0__regfile_tb__DOT__dut__DOT__regs__v0 
            = vlSelfRef.regfile_tb__DOT__rd;
        __VdlySet__regfile_tb__DOT__dut__DOT__regs__v0 = 1U;
    }
    if (__VdlySet__regfile_tb__DOT__dut__DOT__regs__v0) {
        vlSelfRef.regfile_tb__DOT__dut__DOT__regs[__VdlyDim0__regfile_tb__DOT__dut__DOT__regs__v0] 
            = __VdlyVal__regfile_tb__DOT__dut__DOT__regs__v0;
    }
    vlSelfRef.regfile_tb__DOT__dut__DOT__regs[0U] = 0U;
}

void Vreg_file___024root___eval_nba(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval_nba\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
        Vreg_file___024root___nba_sequent__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[3U] = 1U;
    }
}

void Vreg_file___024root___timing_resume(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___timing_resume\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vreg_file___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vreg_file___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vreg_file___024root___eval_phase__act(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval_phase__act\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VactExecute;
    // Body
    Vreg_file___024root___eval_triggers_vec__act(vlSelf);
    Vreg_file___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VactTriggered, vlSelfRef.__VactTriggeredAcc);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vreg_file___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vreg_file___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    __VactExecute = Vreg_file___024root___trigger_anySet__act(vlSelfRef.__VactTriggered);
    if (__VactExecute) {
        vlSelfRef.__VactTriggeredAcc.fill(0ULL);
        Vreg_file___024root___timing_resume(vlSelf);
    }
    return (__VactExecute);
}

void Vreg_file___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vreg_file___024root___eval_phase__nba(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval_phase__nba\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vreg_file___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        Vreg_file___024root___eval_nba(vlSelf);
        Vreg_file___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Vreg_file___024root___eval(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00000064U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vreg_file___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("reg_tb.v", 3, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 100 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00000064U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vreg_file___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("reg_tb.v", 3, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 100 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactPhaseResult = Vreg_file___024root___eval_phase__act(vlSelf);
        } while (vlSelfRef.__VactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vreg_file___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vreg_file___024root___eval_debug_assertions(Vreg_file___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root___eval_debug_assertions\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
