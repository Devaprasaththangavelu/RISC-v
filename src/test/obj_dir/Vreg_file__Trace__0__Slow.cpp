// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals

#include "verilated_vcd_c.h"
#include "Vreg_file__Syms.h"


VL_ATTR_COLD void Vreg_file___024root__trace_init_sub__TOP__0(Vreg_file___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root__trace_init_sub__TOP__0\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const int c = vlSymsp->__Vm_baseCode;
    tracep->pushPrefix("regfile_tb", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+37,0,"clk",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+0,0,"we",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1,0,"rs1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+2,0,"rs2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+3,0,"rd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+4,0,"wd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+38,0,"rd1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+39,0,"rd2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("dut", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+37,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+0,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1,0,"rs1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+2,0,"rs2",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+3,0,"rd",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+4,0,"wd",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+38,0,"rd1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+39,0,"rd2",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("regs", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+5+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void Vreg_file___024root__trace_init_top(Vreg_file___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root__trace_init_top\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vreg_file___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vreg_file___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void Vreg_file___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vreg_file___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vreg_file___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void Vreg_file___024root__trace_register(Vreg_file___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root__trace_register\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&Vreg_file___024root__trace_const_0, 0, vlSelf);
    tracep->addFullCb(&Vreg_file___024root__trace_full_0, 0, vlSelf);
    tracep->addChgCb(&Vreg_file___024root__trace_chg_0, 0, vlSelf);
    tracep->addCleanupCb(&Vreg_file___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vreg_file___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root__trace_const_0\n"); );
    // Body
    Vreg_file___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vreg_file___024root*>(voidSelf);
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
}

VL_ATTR_COLD void Vreg_file___024root__trace_full_0_sub_0(Vreg_file___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vreg_file___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root__trace_full_0\n"); );
    // Body
    Vreg_file___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vreg_file___024root*>(voidSelf);
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    Vreg_file___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vreg_file___024root__trace_full_0_sub_0(Vreg_file___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vreg_file___024root__trace_full_0_sub_0\n"); );
    Vreg_file__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    bufp->fullBit(oldp+0,(vlSelfRef.regfile_tb__DOT__we));
    bufp->fullCData(oldp+1,(vlSelfRef.regfile_tb__DOT__rs1),5);
    bufp->fullCData(oldp+2,(vlSelfRef.regfile_tb__DOT__rs2),5);
    bufp->fullCData(oldp+3,(vlSelfRef.regfile_tb__DOT__rd),5);
    bufp->fullIData(oldp+4,(vlSelfRef.regfile_tb__DOT__wd),32);
    bufp->fullIData(oldp+5,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[0]),32);
    bufp->fullIData(oldp+6,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[1]),32);
    bufp->fullIData(oldp+7,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[2]),32);
    bufp->fullIData(oldp+8,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[3]),32);
    bufp->fullIData(oldp+9,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[4]),32);
    bufp->fullIData(oldp+10,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[5]),32);
    bufp->fullIData(oldp+11,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[6]),32);
    bufp->fullIData(oldp+12,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[7]),32);
    bufp->fullIData(oldp+13,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[8]),32);
    bufp->fullIData(oldp+14,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[9]),32);
    bufp->fullIData(oldp+15,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[10]),32);
    bufp->fullIData(oldp+16,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[11]),32);
    bufp->fullIData(oldp+17,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[12]),32);
    bufp->fullIData(oldp+18,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[13]),32);
    bufp->fullIData(oldp+19,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[14]),32);
    bufp->fullIData(oldp+20,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[15]),32);
    bufp->fullIData(oldp+21,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[16]),32);
    bufp->fullIData(oldp+22,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[17]),32);
    bufp->fullIData(oldp+23,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[18]),32);
    bufp->fullIData(oldp+24,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[19]),32);
    bufp->fullIData(oldp+25,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[20]),32);
    bufp->fullIData(oldp+26,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[21]),32);
    bufp->fullIData(oldp+27,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[22]),32);
    bufp->fullIData(oldp+28,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[23]),32);
    bufp->fullIData(oldp+29,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[24]),32);
    bufp->fullIData(oldp+30,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[25]),32);
    bufp->fullIData(oldp+31,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[26]),32);
    bufp->fullIData(oldp+32,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[27]),32);
    bufp->fullIData(oldp+33,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[28]),32);
    bufp->fullIData(oldp+34,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[29]),32);
    bufp->fullIData(oldp+35,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[30]),32);
    bufp->fullIData(oldp+36,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs[31]),32);
    bufp->fullBit(oldp+37,(vlSelfRef.regfile_tb__DOT__clk));
    bufp->fullIData(oldp+38,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs
                             [vlSelfRef.regfile_tb__DOT__rs1]),32);
    bufp->fullIData(oldp+39,(vlSelfRef.regfile_tb__DOT__dut__DOT__regs
                             [vlSelfRef.regfile_tb__DOT__rs2]),32);
}
