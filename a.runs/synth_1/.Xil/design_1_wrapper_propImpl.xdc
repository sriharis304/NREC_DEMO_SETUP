set_property SRC_FILE_INFO {cfile:c:/Xilinx/a/a.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc rfile:../../../a.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc id:1 order:EARLY scoped_inst:design_1_i/processing_system7_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Xilinx/a/a.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc rfile:../../../a.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc id:2 order:EARLY scoped_inst:design_1_i/clk_wiz_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Xilinx/a/a.srcs/constrs_1/imports/new/video_timing.xdc rfile:../../../a.srcs/constrs_1/imports/new/video_timing.xdc id:3} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Xilinx/a/a.srcs/sources_1/bd/design_1/ip/design_1_cameralink_to_axis_0_0/ip/v_vid_in_axi4s_0/v_vid_in_axi4s_0_clocks.xdc rfile:../../../a.srcs/sources_1/bd/design_1/ip/design_1_cameralink_to_axis_0_0/ip/v_vid_in_axi4s_0/v_vid_in_axi4s_0_clocks.xdc id:4 order:LATE scoped_inst:design_1_i/cameralink_to_axis_0/inst/v_vid_in_axi4s_0_inst/inst} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Xilinx/a/a.srcs/sources_1/bd/design_1/ip/design_1_fifo_generator_0_0/design_1_fifo_generator_0_0/design_1_fifo_generator_0_0_clocks.xdc rfile:../../../a.srcs/sources_1/bd/design_1/ip/design_1_fifo_generator_0_0/design_1_fifo_generator_0_0/design_1_fifo_generator_0_0_clocks.xdc id:5 order:LATE scoped_inst:design_1_i/fifo_generator_0/U0} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_1 0.3
set_property src_info {type:SCOPED_XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_0 0.3
set_property src_info {type:SCOPED_XDC file:2 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.10000000000000001
set_property src_info {type:XDC file:3 line:81 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_clocks clk_out1_design_1_clk_wiz_0_0] -to [get_clocks clk_out2_design_1_clk_wiz_0_0]
set_property src_info {type:XDC file:3 line:83 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_clocks clk_out1_design_1_clk_wiz_0_0] -to [get_clocks clk_out2_design_1_clk_wiz_0_0]
set_property src_info {type:SCOPED_XDC file:4 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_0/inst/v_vid_in_axi4s_0_inst/inst/vid_io_in_clk]] -to [all_registers -clock [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_0/inst/v_vid_in_axi4s_0_inst/inst/aclk]]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_0/inst/v_vid_in_axi4s_0_inst/inst/vid_io_in_clk]]]
set_property src_info {type:SCOPED_XDC file:4 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_0/inst/v_vid_in_axi4s_0_inst/inst/aclk]] -to [all_registers -clock [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_0/inst/v_vid_in_axi4s_0_inst/inst/vid_io_in_clk]]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_0/inst/v_vid_in_axi4s_0_inst/inst/aclk]]]
set_property src_info {type:SCOPED_XDC file:5 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins design_1_i/fifo_generator_0/U0/rd_clk]]]
set_property src_info {type:SCOPED_XDC file:5 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins design_1_i/fifo_generator_0/U0/wr_clk]]]
