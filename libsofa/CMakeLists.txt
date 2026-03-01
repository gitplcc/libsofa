#  CMakeLists.txt
#  
#  Copyright 2021 Pedro Luis Castedo Cepeda <pedroluis.castedo@upm.es>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
set(SOFA_SRCS_DIR ${sofa_SOURCE_DIR}/20231011/c/src)
set(SOFA_PUBLIC_HEADERS
    ${SOFA_SRCS_DIR}/sofa.h
    ${SOFA_SRCS_DIR}/sofam.h
)
set(SOFA_SRCS
    ${SOFA_SRCS_DIR}/a2af.c
    ${SOFA_SRCS_DIR}/a2tf.c
    ${SOFA_SRCS_DIR}/ab.c
    ${SOFA_SRCS_DIR}/ae2hd.c
    ${SOFA_SRCS_DIR}/af2a.c
    ${SOFA_SRCS_DIR}/anp.c
    ${SOFA_SRCS_DIR}/anpm.c
    ${SOFA_SRCS_DIR}/apcg.c
    ${SOFA_SRCS_DIR}/apcg13.c
    ${SOFA_SRCS_DIR}/apci.c
    ${SOFA_SRCS_DIR}/apci13.c
    ${SOFA_SRCS_DIR}/apco.c
    ${SOFA_SRCS_DIR}/apco13.c
    ${SOFA_SRCS_DIR}/apcs.c
    ${SOFA_SRCS_DIR}/apcs13.c
    ${SOFA_SRCS_DIR}/aper.c
    ${SOFA_SRCS_DIR}/aper13.c
    ${SOFA_SRCS_DIR}/apio.c
    ${SOFA_SRCS_DIR}/apio13.c
    ${SOFA_SRCS_DIR}/atcc13.c
    ${SOFA_SRCS_DIR}/atccq.c
    ${SOFA_SRCS_DIR}/atci13.c
    ${SOFA_SRCS_DIR}/atciq.c
    ${SOFA_SRCS_DIR}/atciqn.c
    ${SOFA_SRCS_DIR}/atciqz.c
    ${SOFA_SRCS_DIR}/atco13.c
    ${SOFA_SRCS_DIR}/atic13.c
    ${SOFA_SRCS_DIR}/aticq.c
    ${SOFA_SRCS_DIR}/aticqn.c
    ${SOFA_SRCS_DIR}/atio13.c
    ${SOFA_SRCS_DIR}/atioq.c
    ${SOFA_SRCS_DIR}/atoc13.c
    ${SOFA_SRCS_DIR}/atoi13.c
    ${SOFA_SRCS_DIR}/atoiq.c
    ${SOFA_SRCS_DIR}/bi00.c
    ${SOFA_SRCS_DIR}/bp00.c
    ${SOFA_SRCS_DIR}/bp06.c
    ${SOFA_SRCS_DIR}/bpn2xy.c
    ${SOFA_SRCS_DIR}/c2i00a.c
    ${SOFA_SRCS_DIR}/c2i00b.c
    ${SOFA_SRCS_DIR}/c2i06a.c
    ${SOFA_SRCS_DIR}/c2ibpn.c
    ${SOFA_SRCS_DIR}/c2ixy.c
    ${SOFA_SRCS_DIR}/c2ixys.c
    ${SOFA_SRCS_DIR}/c2s.c
    ${SOFA_SRCS_DIR}/c2t00a.c
    ${SOFA_SRCS_DIR}/c2t00b.c
    ${SOFA_SRCS_DIR}/c2t06a.c
    ${SOFA_SRCS_DIR}/c2tcio.c
    ${SOFA_SRCS_DIR}/c2teqx.c
    ${SOFA_SRCS_DIR}/c2tpe.c
    ${SOFA_SRCS_DIR}/c2txy.c
    ${SOFA_SRCS_DIR}/cal2jd.c
    ${SOFA_SRCS_DIR}/cp.c
    ${SOFA_SRCS_DIR}/cpv.c
    ${SOFA_SRCS_DIR}/cr.c
    ${SOFA_SRCS_DIR}/d2dtf.c
    ${SOFA_SRCS_DIR}/d2tf.c
    ${SOFA_SRCS_DIR}/dat.c
    ${SOFA_SRCS_DIR}/dtdb.c
    ${SOFA_SRCS_DIR}/dtf2d.c
    ${SOFA_SRCS_DIR}/eceq06.c
    ${SOFA_SRCS_DIR}/ecm06.c
    ${SOFA_SRCS_DIR}/ee00.c
    ${SOFA_SRCS_DIR}/ee00a.c
    ${SOFA_SRCS_DIR}/ee00b.c
    ${SOFA_SRCS_DIR}/ee06a.c
    ${SOFA_SRCS_DIR}/eect00.c
    ${SOFA_SRCS_DIR}/eform.c
    ${SOFA_SRCS_DIR}/eo06a.c
    ${SOFA_SRCS_DIR}/eors.c
    ${SOFA_SRCS_DIR}/epb.c
    ${SOFA_SRCS_DIR}/epb2jd.c
    ${SOFA_SRCS_DIR}/epj.c
    ${SOFA_SRCS_DIR}/epj2jd.c
    ${SOFA_SRCS_DIR}/epv00.c
    ${SOFA_SRCS_DIR}/eqec06.c
    ${SOFA_SRCS_DIR}/eqeq94.c
    ${SOFA_SRCS_DIR}/era00.c
    ${SOFA_SRCS_DIR}/fad03.c
    ${SOFA_SRCS_DIR}/fae03.c
    ${SOFA_SRCS_DIR}/faf03.c
    ${SOFA_SRCS_DIR}/faju03.c
    ${SOFA_SRCS_DIR}/fal03.c
    ${SOFA_SRCS_DIR}/falp03.c
    ${SOFA_SRCS_DIR}/fama03.c
    ${SOFA_SRCS_DIR}/fame03.c
    ${SOFA_SRCS_DIR}/fane03.c
    ${SOFA_SRCS_DIR}/faom03.c
    ${SOFA_SRCS_DIR}/fapa03.c
    ${SOFA_SRCS_DIR}/fasa03.c
    ${SOFA_SRCS_DIR}/faur03.c
    ${SOFA_SRCS_DIR}/fave03.c
    ${SOFA_SRCS_DIR}/fk425.c
    ${SOFA_SRCS_DIR}/fk45z.c
    ${SOFA_SRCS_DIR}/fk524.c
    ${SOFA_SRCS_DIR}/fk52h.c
    ${SOFA_SRCS_DIR}/fk54z.c
    ${SOFA_SRCS_DIR}/fk5hip.c
    ${SOFA_SRCS_DIR}/fk5hz.c
    ${SOFA_SRCS_DIR}/fw2m.c
    ${SOFA_SRCS_DIR}/fw2xy.c
    ${SOFA_SRCS_DIR}/g2icrs.c
    ${SOFA_SRCS_DIR}/gc2gd.c
    ${SOFA_SRCS_DIR}/gc2gde.c
    ${SOFA_SRCS_DIR}/gd2gc.c
    ${SOFA_SRCS_DIR}/gd2gce.c
    ${SOFA_SRCS_DIR}/gmst00.c
    ${SOFA_SRCS_DIR}/gmst06.c
    ${SOFA_SRCS_DIR}/gmst82.c
    ${SOFA_SRCS_DIR}/gst00a.c
    ${SOFA_SRCS_DIR}/gst00b.c
    ${SOFA_SRCS_DIR}/gst06.c
    ${SOFA_SRCS_DIR}/gst06a.c
    ${SOFA_SRCS_DIR}/gst94.c
    ${SOFA_SRCS_DIR}/h2fk5.c
    ${SOFA_SRCS_DIR}/hd2ae.c
    ${SOFA_SRCS_DIR}/hd2pa.c
    ${SOFA_SRCS_DIR}/hfk5z.c
    ${SOFA_SRCS_DIR}/icrs2g.c
    ${SOFA_SRCS_DIR}/ir.c
    ${SOFA_SRCS_DIR}/jd2cal.c
    ${SOFA_SRCS_DIR}/jdcalf.c
    ${SOFA_SRCS_DIR}/ld.c
    ${SOFA_SRCS_DIR}/ldn.c
    ${SOFA_SRCS_DIR}/ldsun.c
    ${SOFA_SRCS_DIR}/lteceq.c
    ${SOFA_SRCS_DIR}/ltecm.c
    ${SOFA_SRCS_DIR}/lteqec.c
    ${SOFA_SRCS_DIR}/ltp.c
    ${SOFA_SRCS_DIR}/ltpb.c
    ${SOFA_SRCS_DIR}/ltpecl.c
    ${SOFA_SRCS_DIR}/ltpequ.c
    ${SOFA_SRCS_DIR}/moon98.c
    ${SOFA_SRCS_DIR}/num00a.c
    ${SOFA_SRCS_DIR}/num00b.c
    ${SOFA_SRCS_DIR}/num06a.c
    ${SOFA_SRCS_DIR}/numat.c
    ${SOFA_SRCS_DIR}/nut00a.c
    ${SOFA_SRCS_DIR}/nut00b.c
    ${SOFA_SRCS_DIR}/nut06a.c
    ${SOFA_SRCS_DIR}/nut80.c
    ${SOFA_SRCS_DIR}/nutm80.c
    ${SOFA_SRCS_DIR}/obl06.c
    ${SOFA_SRCS_DIR}/obl80.c
    ${SOFA_SRCS_DIR}/p06e.c
    ${SOFA_SRCS_DIR}/p2pv.c
    ${SOFA_SRCS_DIR}/p2s.c
    ${SOFA_SRCS_DIR}/pap.c
    ${SOFA_SRCS_DIR}/pas.c
    ${SOFA_SRCS_DIR}/pb06.c
    ${SOFA_SRCS_DIR}/pdp.c
    ${SOFA_SRCS_DIR}/pfw06.c
    ${SOFA_SRCS_DIR}/plan94.c
    ${SOFA_SRCS_DIR}/pm.c
    ${SOFA_SRCS_DIR}/pmat00.c
    ${SOFA_SRCS_DIR}/pmat06.c
    ${SOFA_SRCS_DIR}/pmat76.c
    ${SOFA_SRCS_DIR}/pmp.c
    ${SOFA_SRCS_DIR}/pmpx.c
    ${SOFA_SRCS_DIR}/pmsafe.c
    ${SOFA_SRCS_DIR}/pn.c
    ${SOFA_SRCS_DIR}/pn00.c
    ${SOFA_SRCS_DIR}/pn00a.c
    ${SOFA_SRCS_DIR}/pn00b.c
    ${SOFA_SRCS_DIR}/pn06.c
    ${SOFA_SRCS_DIR}/pn06a.c
    ${SOFA_SRCS_DIR}/pnm00a.c
    ${SOFA_SRCS_DIR}/pnm00b.c
    ${SOFA_SRCS_DIR}/pnm06a.c
    ${SOFA_SRCS_DIR}/pnm80.c
    ${SOFA_SRCS_DIR}/pom00.c
    ${SOFA_SRCS_DIR}/ppp.c
    ${SOFA_SRCS_DIR}/ppsp.c
    ${SOFA_SRCS_DIR}/pr00.c
    ${SOFA_SRCS_DIR}/prec76.c
    ${SOFA_SRCS_DIR}/pv2p.c
    ${SOFA_SRCS_DIR}/pv2s.c
    ${SOFA_SRCS_DIR}/pvdpv.c
    ${SOFA_SRCS_DIR}/pvm.c
    ${SOFA_SRCS_DIR}/pvmpv.c
    ${SOFA_SRCS_DIR}/pvppv.c
    ${SOFA_SRCS_DIR}/pvstar.c
    ${SOFA_SRCS_DIR}/pvtob.c
    ${SOFA_SRCS_DIR}/pvu.c
    ${SOFA_SRCS_DIR}/pvup.c
    ${SOFA_SRCS_DIR}/pvxpv.c
    ${SOFA_SRCS_DIR}/pxp.c
    ${SOFA_SRCS_DIR}/refco.c
    ${SOFA_SRCS_DIR}/rm2v.c
    ${SOFA_SRCS_DIR}/rv2m.c
    ${SOFA_SRCS_DIR}/rx.c
    ${SOFA_SRCS_DIR}/rxp.c
    ${SOFA_SRCS_DIR}/rxpv.c
    ${SOFA_SRCS_DIR}/rxr.c
    ${SOFA_SRCS_DIR}/ry.c
    ${SOFA_SRCS_DIR}/rz.c
    ${SOFA_SRCS_DIR}/s00.c
    ${SOFA_SRCS_DIR}/s00a.c
    ${SOFA_SRCS_DIR}/s00b.c
    ${SOFA_SRCS_DIR}/s06.c
    ${SOFA_SRCS_DIR}/s06a.c
    ${SOFA_SRCS_DIR}/s2c.c
    ${SOFA_SRCS_DIR}/s2p.c
    ${SOFA_SRCS_DIR}/s2pv.c
    ${SOFA_SRCS_DIR}/s2xpv.c
    ${SOFA_SRCS_DIR}/sepp.c
    ${SOFA_SRCS_DIR}/seps.c
    ${SOFA_SRCS_DIR}/sp00.c
    ${SOFA_SRCS_DIR}/starpm.c
    ${SOFA_SRCS_DIR}/starpv.c
    ${SOFA_SRCS_DIR}/sxp.c
    ${SOFA_SRCS_DIR}/sxpv.c
    ${SOFA_SRCS_DIR}/t_sofa_c.c
    ${SOFA_SRCS_DIR}/taitt.c
    ${SOFA_SRCS_DIR}/taiut1.c
    ${SOFA_SRCS_DIR}/taiutc.c
    ${SOFA_SRCS_DIR}/tcbtdb.c
    ${SOFA_SRCS_DIR}/tcgtt.c
    ${SOFA_SRCS_DIR}/tdbtcb.c
    ${SOFA_SRCS_DIR}/tdbtt.c
    ${SOFA_SRCS_DIR}/tf2a.c
    ${SOFA_SRCS_DIR}/tf2d.c
    ${SOFA_SRCS_DIR}/tpors.c
    ${SOFA_SRCS_DIR}/tporv.c
    ${SOFA_SRCS_DIR}/tpsts.c
    ${SOFA_SRCS_DIR}/tpstv.c
    ${SOFA_SRCS_DIR}/tpxes.c
    ${SOFA_SRCS_DIR}/tpxev.c
    ${SOFA_SRCS_DIR}/tr.c
    ${SOFA_SRCS_DIR}/trxp.c
    ${SOFA_SRCS_DIR}/trxpv.c
    ${SOFA_SRCS_DIR}/tttai.c
    ${SOFA_SRCS_DIR}/tttcg.c
    ${SOFA_SRCS_DIR}/tttdb.c
    ${SOFA_SRCS_DIR}/ttut1.c
    ${SOFA_SRCS_DIR}/ut1tai.c
    ${SOFA_SRCS_DIR}/ut1tt.c
    ${SOFA_SRCS_DIR}/ut1utc.c
    ${SOFA_SRCS_DIR}/utctai.c
    ${SOFA_SRCS_DIR}/utcut1.c
    ${SOFA_SRCS_DIR}/xy06.c
    ${SOFA_SRCS_DIR}/xys00a.c
    ${SOFA_SRCS_DIR}/xys00b.c
    ${SOFA_SRCS_DIR}/xys06a.c
    ${SOFA_SRCS_DIR}/zp.c
    ${SOFA_SRCS_DIR}/zpv.c
    ${SOFA_SRCS_DIR}/zr.c
)
add_library(SOFA)
target_sources(SOFA
  PUBLIC
    FILE_SET sofa_hdrs
      TYPE HEADERS
      BASE_DIRS
        ${SOFA_SRCS_DIR}
      FILES
        ${SOFA_PUBLIC_HEADERS}
  PRIVATE
    ${SOFA_SRCS}
)
target_compile_features(SOFA PUBLIC c_std_11)
set_target_properties(SOFA
    PROPERTIES
        C_EXTENSIONS OFF
        OUTPUT_NAME sofa
        POSITION_INDEPENDENT_CODE ${CMAKE_C_LINK_PIE_SUPPORTED}
)
if (BUILD_SHARED_LIBS)
    set_target_properties(SOFA
        PROPERTIES
            C_VISIBILITY_PRESET hidden
    )
endif (BUILD_SHARED_LIBS)
target_include_directories(SOFA
    PUBLIC
        $<BUILD_INTERFACE:${sofa_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)
target_link_libraries(SOFA $<$<BOOL::${MATH_LIBRARY}>:${MATH_LIBRARY}>)

add_library(SOFA::SOFA ALIAS SOFA)

# install stuff
install(
    TARGETS  SOFA
    EXPORT   SOFATargets
    FILE_SET sofa_hdrs
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/libsofa"
)
