set_property SRC_FILE_INFO {cfile:/home/ltcranda/Documents/CMU/HeadlightResearch/HeadlightMaskingLocal/Headlight_antiglare_wit_arm_srihari/a.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc rfile:../../../a.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc id:1 order:EARLY scoped_inst:design_1_i/processing_system7_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/ltcranda/Documents/CMU/HeadlightResearch/HeadlightMaskingLocal/Headlight_antiglare_wit_arm_srihari/a.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc rfile:../../../a.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc id:2 order:EARLY scoped_inst:design_1_i/clk_wiz_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/ltcranda/Documents/CMU/HeadlightResearch/HeadlightMaskingLocal/Headlight_antiglare_wit_arm_srihari/a.srcs/constrs_1/imports/new/Cameralink_deca.xdc rfile:../../../a.srcs/constrs_1/imports/new/Cameralink_deca.xdc id:3} [current_design]
set_property SRC_FILE_INFO {cfile:/home/ltcranda/Documents/CMU/HeadlightResearch/HeadlightMaskingLocal/Headlight_antiglare_wit_arm_srihari/a.srcs/sources_1/bd/design_1/ip/design_1_fifo_generator_0_0/design_1_fifo_generator_0_0/design_1_fifo_generator_0_0_clocks.xdc rfile:../../../a.srcs/sources_1/bd/design_1/ip/design_1_fifo_generator_0_0/design_1_fifo_generator_0_0/design_1_fifo_generator_0_0_clocks.xdc id:4 order:LATE scoped_inst:design_1_i/fifo_generator_0/U0} [current_design]
set_property SRC_FILE_INFO {cfile:/home/ltcranda/Documents/CMU/HeadlightResearch/HeadlightMaskingLocal/Headlight_antiglare_wit_arm_srihari/a.srcs/sources_1/bd/design_1/ip/design_1_cameralink_to_axis_1_0/ip/v_vid_in_axi4s_0/v_vid_in_axi4s_0_clocks.xdc rfile:../../../a.srcs/sources_1/bd/design_1/ip/design_1_cameralink_to_axis_1_0/ip/v_vid_in_axi4s_0/v_vid_in_axi4s_0_clocks.xdc id:5 order:LATE scoped_inst:design_1_i/cameralink_to_axis_1/inst/v_vid_in_axi4s_0_inst/inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_0 0.3
set_property src_info {type:SCOPED_XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_1 0.3
set_property src_info {type:SCOPED_XDC file:2 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.10000000000000001
set_property src_info {type:XDC file:3 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_clocks clk_out1_design_1_clk_wiz_0_0] -to [get_clocks clk_out2_design_1_clk_wiz_0_0]
set_property src_info {type:XDC file:3 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_clocks clk_out1_design_1_clk_wiz_0_0] -to [get_clocks clk_out2_design_1_clk_wiz_0_0]
set_property src_info {type:XDC file:3 line:407 export:INPUT save:INPUT read:READ} [current_design]
create_debug_core u_ila_0 ila
set_property src_info {type:XDC file:3 line:408 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:3 line:409 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:3 line:410 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:3 line:411 export:INPUT save:INPUT read:READ} [current_design]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:3 line:412 export:INPUT save:INPUT read:READ} [current_design]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:3 line:413 export:INPUT save:INPUT read:READ} [current_design]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:3 line:414 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:3 line:415 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:3 line:416 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
set_property src_info {type:XDC file:3 line:417 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/clk_wiz_0_clk_out1]]
set_property src_info {type:XDC file:3 line:418 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:3 line:419 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/address_gen_param_0/inst/frame_counter[0]} {design_1_i/address_gen_param_0/inst/frame_counter[1]} {design_1_i/address_gen_param_0/inst/frame_counter[2]} {design_1_i/address_gen_param_0/inst/frame_counter[3]} {design_1_i/address_gen_param_0/inst/frame_counter[4]} {design_1_i/address_gen_param_0/inst/frame_counter[5]} {design_1_i/address_gen_param_0/inst/frame_counter[6]} {design_1_i/address_gen_param_0/inst/frame_counter[7]} {design_1_i/address_gen_param_0/inst/frame_counter[8]} {design_1_i/address_gen_param_0/inst/frame_counter[9]} {design_1_i/address_gen_param_0/inst/frame_counter[10]} {design_1_i/address_gen_param_0/inst/frame_counter[11]} {design_1_i/address_gen_param_0/inst/frame_counter[12]} {design_1_i/address_gen_param_0/inst/frame_counter[13]} {design_1_i/address_gen_param_0/inst/frame_counter[14]} {design_1_i/address_gen_param_0/inst/frame_counter[15]}]]
set_property src_info {type:XDC file:3 line:420 export:INPUT save:INPUT read:READ} [current_design]
create_debug_core u_ila_1 ila
set_property src_info {type:XDC file:3 line:421 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property src_info {type:XDC file:3 line:422 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_1]
set_property src_info {type:XDC file:3 line:423 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_1]
set_property src_info {type:XDC file:3 line:424 export:INPUT save:INPUT read:READ} [current_design]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property src_info {type:XDC file:3 line:425 export:INPUT save:INPUT read:READ} [current_design]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property src_info {type:XDC file:3 line:426 export:INPUT save:INPUT read:READ} [current_design]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_1]
set_property src_info {type:XDC file:3 line:427 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property src_info {type:XDC file:3 line:428 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property src_info {type:XDC file:3 line:429 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
set_property src_info {type:XDC file:3 line:430 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/clk [get_nets [list design_1_i/clk_wiz_0_clk_out2]]
set_property src_info {type:XDC file:3 line:431 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 7 [get_debug_ports u_ila_1/probe0]
set_property src_info {type:XDC file:3 line:432 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/probe0 [get_nets [list {design_1_i/homography_latest_0/inst/doLookUpInst/count_data[0]} {design_1_i/homography_latest_0/inst/doLookUpInst/count_data[1]} {design_1_i/homography_latest_0/inst/doLookUpInst/count_data[2]} {design_1_i/homography_latest_0/inst/doLookUpInst/count_data[3]} {design_1_i/homography_latest_0/inst/doLookUpInst/count_data[4]} {design_1_i/homography_latest_0/inst/doLookUpInst/count_data[5]} {design_1_i/homography_latest_0/inst/doLookUpInst/count_data[6]}]]
set_property src_info {type:XDC file:3 line:433 export:INPUT save:INPUT read:READ} [current_design]
create_debug_core u_ila_2 ila
set_property src_info {type:XDC file:3 line:434 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property src_info {type:XDC file:3 line:435 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_2]
set_property src_info {type:XDC file:3 line:436 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_2]
set_property src_info {type:XDC file:3 line:437 export:INPUT save:INPUT read:READ} [current_design]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2]
set_property src_info {type:XDC file:3 line:438 export:INPUT save:INPUT read:READ} [current_design]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_2]
set_property src_info {type:XDC file:3 line:439 export:INPUT save:INPUT read:READ} [current_design]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_2]
set_property src_info {type:XDC file:3 line:440 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property src_info {type:XDC file:3 line:441 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property src_info {type:XDC file:3 line:442 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
set_property src_info {type:XDC file:3 line:443 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_2/clk [get_nets [list pixel_clk_out]]
set_property src_info {type:XDC file:3 line:444 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 16 [get_debug_ports u_ila_2/probe0]
set_property src_info {type:XDC file:3 line:445 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_2/probe0 [get_nets [list {vid_io_out_data[0]} {vid_io_out_data[1]} {vid_io_out_data[2]} {vid_io_out_data[3]} {vid_io_out_data[4]} {vid_io_out_data[5]} {vid_io_out_data[6]} {vid_io_out_data[7]} {vid_io_out_data[8]} {vid_io_out_data[9]} {vid_io_out_data[10]} {vid_io_out_data[11]} {vid_io_out_data[12]} {vid_io_out_data[13]} {vid_io_out_data[14]} {vid_io_out_data[15]}]]
set_property src_info {type:XDC file:3 line:446 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:447 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 10 [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:3 line:448 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/address_gen_param_0/inst/line_counter[0]} {design_1_i/address_gen_param_0/inst/line_counter[1]} {design_1_i/address_gen_param_0/inst/line_counter[2]} {design_1_i/address_gen_param_0/inst/line_counter[3]} {design_1_i/address_gen_param_0/inst/line_counter[4]} {design_1_i/address_gen_param_0/inst/line_counter[5]} {design_1_i/address_gen_param_0/inst/line_counter[6]} {design_1_i/address_gen_param_0/inst/line_counter[7]} {design_1_i/address_gen_param_0/inst/line_counter[8]} {design_1_i/address_gen_param_0/inst/line_counter[9]}]]
set_property src_info {type:XDC file:3 line:449 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:450 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:3 line:451 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/address_gen_param_0/inst/line_pos_counter[0]} {design_1_i/address_gen_param_0/inst/line_pos_counter[1]} {design_1_i/address_gen_param_0/inst/line_pos_counter[2]} {design_1_i/address_gen_param_0/inst/line_pos_counter[3]} {design_1_i/address_gen_param_0/inst/line_pos_counter[4]} {design_1_i/address_gen_param_0/inst/line_pos_counter[5]} {design_1_i/address_gen_param_0/inst/line_pos_counter[6]} {design_1_i/address_gen_param_0/inst/line_pos_counter[7]}]]
set_property src_info {type:XDC file:3 line:452 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:453 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 64 [get_debug_ports u_ila_0/probe3]
set_property src_info {type:XDC file:3 line:454 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/axis_dwidth_converter_0/m_axis_tdata[0]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[1]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[2]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[3]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[4]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[5]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[6]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[7]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[8]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[9]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[10]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[11]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[12]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[13]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[14]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[15]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[16]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[17]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[18]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[19]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[20]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[21]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[22]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[23]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[24]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[25]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[26]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[27]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[28]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[29]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[30]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[31]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[32]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[33]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[34]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[35]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[36]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[37]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[38]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[39]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[40]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[41]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[42]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[43]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[44]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[45]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[46]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[47]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[48]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[49]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[50]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[51]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[52]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[53]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[54]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[55]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[56]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[57]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[58]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[59]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[60]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[61]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[62]} {design_1_i/axis_dwidth_converter_0/m_axis_tdata[63]}]]
set_property src_info {type:XDC file:3 line:455 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:456 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
set_property src_info {type:XDC file:3 line:457 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/axis_dwidth_converter_0/m_axis_tuser[0]} {design_1_i/axis_dwidth_converter_0/m_axis_tuser[1]} {design_1_i/axis_dwidth_converter_0/m_axis_tuser[2]} {design_1_i/axis_dwidth_converter_0/m_axis_tuser[3]} {design_1_i/axis_dwidth_converter_0/m_axis_tuser[4]} {design_1_i/axis_dwidth_converter_0/m_axis_tuser[5]} {design_1_i/axis_dwidth_converter_0/m_axis_tuser[6]} {design_1_i/axis_dwidth_converter_0/m_axis_tuser[7]}]]
set_property src_info {type:XDC file:3 line:458 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:459 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
set_property src_info {type:XDC file:3 line:460 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe5 [get_nets [list {design_1_i/address_gen_param_0/data_in[0]} {design_1_i/address_gen_param_0/data_in[1]} {design_1_i/address_gen_param_0/data_in[2]} {design_1_i/address_gen_param_0/data_in[3]} {design_1_i/address_gen_param_0/data_in[4]} {design_1_i/address_gen_param_0/data_in[5]} {design_1_i/address_gen_param_0/data_in[6]} {design_1_i/address_gen_param_0/data_in[7]}]]
set_property src_info {type:XDC file:3 line:461 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:462 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 13 [get_debug_ports u_ila_0/probe6]
set_property src_info {type:XDC file:3 line:463 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe6 [get_nets [list {design_1_i/address_gen_param_0/bram_addr_in[0]} {design_1_i/address_gen_param_0/bram_addr_in[1]} {design_1_i/address_gen_param_0/bram_addr_in[2]} {design_1_i/address_gen_param_0/bram_addr_in[3]} {design_1_i/address_gen_param_0/bram_addr_in[4]} {design_1_i/address_gen_param_0/bram_addr_in[5]} {design_1_i/address_gen_param_0/bram_addr_in[6]} {design_1_i/address_gen_param_0/bram_addr_in[7]} {design_1_i/address_gen_param_0/bram_addr_in[8]} {design_1_i/address_gen_param_0/bram_addr_in[9]} {design_1_i/address_gen_param_0/bram_addr_in[10]} {design_1_i/address_gen_param_0/bram_addr_in[11]} {design_1_i/address_gen_param_0/bram_addr_in[12]}]]
set_property src_info {type:XDC file:3 line:464 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:465 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
set_property src_info {type:XDC file:3 line:466 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe7 [get_nets [list {design_1_i/address_gen_param_0/data_out[0]} {design_1_i/address_gen_param_0/data_out[1]} {design_1_i/address_gen_param_0/data_out[2]} {design_1_i/address_gen_param_0/data_out[3]} {design_1_i/address_gen_param_0/data_out[4]} {design_1_i/address_gen_param_0/data_out[5]} {design_1_i/address_gen_param_0/data_out[6]} {design_1_i/address_gen_param_0/data_out[7]}]]
set_property src_info {type:XDC file:3 line:467 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:468 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
set_property src_info {type:XDC file:3 line:469 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe8 [get_nets [list design_1_i/axis_dwidth_converter_0/m_axis_tvalid]]
set_property src_info {type:XDC file:3 line:470 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:3 line:471 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
set_property src_info {type:XDC file:3 line:472 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe9 [get_nets [list design_1_i/address_gen_param_0/sof_to_homography]]
set_property src_info {type:XDC file:3 line:473 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_1 probe
set_property src_info {type:XDC file:3 line:474 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 8 [get_debug_ports u_ila_1/probe1]
set_property src_info {type:XDC file:3 line:475 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/probe1 [get_nets [list {design_1_i/homography_latest_0/dout_image_in_b[0]} {design_1_i/homography_latest_0/dout_image_in_b[1]} {design_1_i/homography_latest_0/dout_image_in_b[2]} {design_1_i/homography_latest_0/dout_image_in_b[3]} {design_1_i/homography_latest_0/dout_image_in_b[4]} {design_1_i/homography_latest_0/dout_image_in_b[5]} {design_1_i/homography_latest_0/dout_image_in_b[6]} {design_1_i/homography_latest_0/dout_image_in_b[7]}]]
set_property src_info {type:XDC file:3 line:476 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_1 probe
set_property src_info {type:XDC file:3 line:477 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 10 [get_debug_ports u_ila_1/probe2]
set_property src_info {type:XDC file:3 line:478 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/probe2 [get_nets [list {design_1_i/homography_latest_0/inst/line_counter_homography[0]} {design_1_i/homography_latest_0/inst/line_counter_homography[1]} {design_1_i/homography_latest_0/inst/line_counter_homography[2]} {design_1_i/homography_latest_0/inst/line_counter_homography[3]} {design_1_i/homography_latest_0/inst/line_counter_homography[4]} {design_1_i/homography_latest_0/inst/line_counter_homography[5]} {design_1_i/homography_latest_0/inst/line_counter_homography[6]} {design_1_i/homography_latest_0/inst/line_counter_homography[7]} {design_1_i/homography_latest_0/inst/line_counter_homography[8]} {design_1_i/homography_latest_0/inst/line_counter_homography[9]}]]
set_property src_info {type:XDC file:3 line:479 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_1 probe
set_property src_info {type:XDC file:3 line:480 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 8 [get_debug_ports u_ila_1/probe3]
set_property src_info {type:XDC file:3 line:481 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/probe3 [get_nets [list {design_1_i/homography_latest_0/data_to_dmd[0]} {design_1_i/homography_latest_0/data_to_dmd[1]} {design_1_i/homography_latest_0/data_to_dmd[2]} {design_1_i/homography_latest_0/data_to_dmd[3]} {design_1_i/homography_latest_0/data_to_dmd[4]} {design_1_i/homography_latest_0/data_to_dmd[5]} {design_1_i/homography_latest_0/data_to_dmd[6]} {design_1_i/homography_latest_0/data_to_dmd[7]}]]
set_property src_info {type:XDC file:3 line:482 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_1 probe
set_property src_info {type:XDC file:3 line:483 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 13 [get_debug_ports u_ila_1/probe4]
set_property src_info {type:XDC file:3 line:484 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/probe4 [get_nets [list {design_1_i/homography_latest_0/addr_image_in_b[0]} {design_1_i/homography_latest_0/addr_image_in_b[1]} {design_1_i/homography_latest_0/addr_image_in_b[2]} {design_1_i/homography_latest_0/addr_image_in_b[3]} {design_1_i/homography_latest_0/addr_image_in_b[4]} {design_1_i/homography_latest_0/addr_image_in_b[5]} {design_1_i/homography_latest_0/addr_image_in_b[6]} {design_1_i/homography_latest_0/addr_image_in_b[7]} {design_1_i/homography_latest_0/addr_image_in_b[8]} {design_1_i/homography_latest_0/addr_image_in_b[9]} {design_1_i/homography_latest_0/addr_image_in_b[10]} {design_1_i/homography_latest_0/addr_image_in_b[11]} {design_1_i/homography_latest_0/addr_image_in_b[12]}]]
set_property src_info {type:XDC file:3 line:485 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_1 probe
set_property src_info {type:XDC file:3 line:486 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
set_property src_info {type:XDC file:3 line:487 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/probe5 [get_nets [list design_1_i/homography_latest_0_tvalid]]
set_property src_info {type:XDC file:3 line:488 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_1 probe
set_property src_info {type:XDC file:3 line:489 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_1/probe6]
set_property src_info {type:XDC file:3 line:490 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/probe6 [get_nets [list design_1_i/homography_latest_0/scan_start]]
set_property src_info {type:XDC file:3 line:491 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_1 probe
set_property src_info {type:XDC file:3 line:492 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
set_property src_info {type:XDC file:3 line:493 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_1/probe7 [get_nets [list design_1_i/homography_latest_0/tvalid]]
set_property src_info {type:XDC file:3 line:494 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_2 probe
set_property src_info {type:XDC file:3 line:495 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_2/probe1]
set_property src_info {type:XDC file:3 line:496 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_2/probe1 [get_nets [list vid_io_out_active_video]]
set_property src_info {type:XDC file:3 line:497 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_2 probe
set_property src_info {type:XDC file:3 line:498 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_2/probe2]
set_property src_info {type:XDC file:3 line:499 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_2/probe2 [get_nets [list vid_io_out_hsync]]
set_property src_info {type:XDC file:3 line:500 export:INPUT save:INPUT read:READ} [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:3 line:501 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:3 line:502 export:INPUT save:INPUT read:READ} [current_design]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:3 line:503 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_wiz_0_clk_out1]
set_property src_info {type:SCOPED_XDC file:4 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins design_1_i/fifo_generator_0/U0/rd_clk]]]
set_property src_info {type:SCOPED_XDC file:4 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins design_1_i/fifo_generator_0/U0/wr_clk]]]
set_property src_info {type:SCOPED_XDC file:5 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_1/inst/v_vid_in_axi4s_0_inst/inst/vid_io_in_clk]] -to [all_registers -clock [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_1/inst/v_vid_in_axi4s_0_inst/inst/aclk]]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_1/inst/v_vid_in_axi4s_0_inst/inst/vid_io_in_clk]]]
set_property src_info {type:SCOPED_XDC file:5 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_1/inst/v_vid_in_axi4s_0_inst/inst/aclk]] -to [all_registers -clock [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_1/inst/v_vid_in_axi4s_0_inst/inst/vid_io_in_clk]]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins design_1_i/cameralink_to_axis_1/inst/v_vid_in_axi4s_0_inst/inst/aclk]]]
