CLASS zcl_ce_asset_tg_rp_implement DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC INHERITING FROM cx_rap_query_provider.

  PUBLIC SECTION.
    TYPES: tt_result TYPE STANDARD TABLE OF zce_asset_tg_rp,
           ry_string TYPE RANGE OF string.

    CLASS-METHODS requested
      IMPORTING
        io_request TYPE REF TO if_rap_query_request
      EXPORTING
        et_filters TYPE if_rap_query_filter=>tt_name_range_pairs.

    CLASS-METHODS response
      IMPORTING
        io_request  TYPE REF TO if_rap_query_request
        io_response TYPE REF TO if_rap_query_response
      CHANGING
        ct_result   TYPE tt_result.

    CLASS-METHODS select
      IMPORTING
        it_filters TYPE if_rap_query_filter=>tt_name_range_pairs
      EXPORTING
        et_result  TYPE tt_result
      RAISING
        cx_rap_query_provider.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-METHODS build_params
      IMPORTING
        it_filters           TYPE  if_rap_query_filter=>tt_name_range_pairs
      EXPORTING
        er_companycode       TYPE ry_string
        er_depreciationareas TYPE ry_string
        er_fiscalyear        TYPE ry_string
        er_periods           TYPE ry_string
        er_assetnumber       TYPE ry_string
        er_assetsubnumber    TYPE ry_string
        er_postingdate       TYPE ry_string
        ev_fiscalyear        TYPE string
        ev_periods           TYPE string
        er_fromdate          TYPE ry_string
        er_todate            TYPE ry_string
        ev_keydate           TYPE d
        er_loaitaisan        TYPE ry_string
        er_maphongban        TYPE ry_string
      RAISING
        cx_rap_query_provider.

    CLASS-METHODS get_params
      IMPORTING
        it_filters           TYPE if_rap_query_filter=>tt_name_range_pairs
      EXPORTING
        er_companycode       TYPE ry_string
        er_DEPRECIATIONAREAS TYPE ry_string
        er_FISCALYEAR        TYPE ry_string
        er_PERIODS           TYPE ry_string
        er_ASSETNUMBER       TYPE ry_string
        er_ASSETSUBNUMBER    TYPE ry_string
        er_POSTINGDATE       TYPE ry_string
        er_loaitaisan        TYPE ry_string
        er_maphongban        TYPE ry_string.

    CLASS-METHODS build_special_params
      IMPORTING
        ir_fiscalyear  TYPE ry_string
      EXPORTING
        ev_fiscalyear  TYPE string
        ev_periods     TYPE string
        er_fromdate    TYPE ry_string
        er_todate      TYPE ry_string
        ev_keydate     TYPE d
      CHANGING
        cr_periods     TYPE ry_string
        cr_postingdate TYPE ry_string
      RAISING
        cx_rap_query_provider.

    CLASS-METHODS modify_periods_postingdate
      IMPORTING
        ir_fiscalyear  TYPE ry_string
      CHANGING
        cr_periods     TYPE ry_string
        cr_postingdate TYPE ry_string
      RAISING
        cx_rap_query_provider.

    CLASS-METHODS get_fiscal_year
      IMPORTING
        ir_FISCALYEAR TYPE ry_string
      EXPORTING
        ev_fiscalyear TYPE string.

    CLASS-METHODS get_periods
      IMPORTING
        ir_postingdate TYPE ry_string
      EXPORTING
        ev_periods     TYPE string.

    CLASS-METHODS get_fromto
      IMPORTING
        ir_postingdate TYPE ry_string
        ir_periods     TYPE ry_string
        iv_fiscalyear  TYPE string
        iv_periods     TYPE string
      EXPORTING
        er_fromdate    TYPE ry_string
        er_todate      TYPE ry_string
        ev_keydate     TYPE d.

    CLASS-METHODS validate_postingdate_periods
      IMPORTING
        ir_fiscalyear  TYPE ry_string
        ir_postingdate TYPE ry_string
        ir_periods     TYPE ry_string
      RAISING
        cx_rap_query_provider.

    CLASS-METHODS modify_periods
      CHANGING
        cr_periods TYPE ry_string.

    CLASS-METHODS modify_postingdate
      IMPORTING
        ir_fiscalyear  TYPE ry_string
        ir_periods     TYPE ry_string
      CHANGING
        cr_postingdate TYPE ry_string.

    CLASS-METHODS build_main_data
      IMPORTING
        ir_companycode       TYPE ry_string
        ir_depreciationareas TYPE ry_string
        ir_assetnumber       TYPE ry_string
        ir_assetsubnumber    TYPE ry_string
        ir_fiscalyear        TYPE ry_string
        ir_postingdate       TYPE ry_string
        ir_fromdate          TYPE ry_string
        ir_todate            TYPE ry_string
        iv_fiscalyear        TYPE string
        iv_periods           TYPE string
        iv_keydate           TYPE d
        ir_loaitaisan        TYPE ry_string
        ir_maphongban        TYPE ry_string
      EXPORTING
        et_keys              TYPE zcl_ce_asset_tg_rp_top=>tt_key
        et_keys_gia          TYPE zcl_ce_asset_tg_rp_top=>tt_key_gia
        et_bases             TYPE zcl_ce_asset_tg_rp_top=>tt_base
        et_giadaukya         TYPE zcl_ce_asset_tg_rp_top=>tt_gia_a
        et_giadaukyb         TYPE zcl_ce_asset_tg_rp_top=>tt_gia_b
        et_tanggiamgia       TYPE zcl_ce_asset_tg_rp_top=>tt_tanggiamgia
        et_config            TYPE zcl_ce_asset_tg_rp_top=>tt_config.

    CLASS-METHODS get_result
      IMPORTING
        it_keys        TYPE zcl_ce_asset_tg_rp_top=>tt_key
        it_bases       TYPE zcl_ce_asset_tg_rp_top=>tt_base
        it_giadaukya   TYPE zcl_ce_asset_tg_rp_top=>tt_gia_a
        it_giadaukyb   TYPE zcl_ce_asset_tg_rp_top=>tt_gia_b
        it_tanggiamgia TYPE zcl_ce_asset_tg_rp_top=>tt_tanggiamgia
        it_config      TYPE zcl_ce_asset_tg_rp_top=>tt_config
      EXPORTING
        et_result      TYPE tt_result.

    CLASS-METHODS get_key
      IMPORTING
        ir_companycode       TYPE ry_string
        ir_depreciationareas TYPE ry_string
        ir_assetnumber       TYPE ry_string
        ir_ASSETSUBNUMBER    TYPE ry_string
        ir_FISCALYEAR        TYPE ry_string
        ir_postingdate       TYPE ry_string
        ir_fromdate          TYPE ry_string
        ir_todate            TYPE ry_string
        iv_fiscalyear        TYPE string
        iv_periods           TYPE string
        iv_keydate           TYPE d
        ir_loaitaisan        TYPE ry_string
        ir_maphongban        TYPE ry_string
      EXPORTING
        et_keys              TYPE zcl_ce_asset_tg_rp_top=>tt_key
        et_keys_gia          TYPE zcl_ce_asset_tg_rp_top=>tt_key_gia.

    CLASS-METHODS get_result_key
      IMPORTING
        is_key    TYPE zcl_ce_asset_tg_rp_top=>ty_key
        iv_tabix  TYPE i
      CHANGING
        cs_result TYPE zce_asset_tg_rp.

    CLASS-METHODS get_base
      IMPORTING
        it_keys       TYPE zcl_ce_asset_tg_rp_top=>tt_key
        iv_fiscalyear TYPE string
        iv_periods    TYPE string
        iv_keydate    TYPE d
      EXPORTING
        et_bases      TYPE zcl_ce_asset_tg_rp_top=>tt_base.

    CLASS-METHODS get_result_base
      IMPORTING
        is_base   TYPE zcl_ce_asset_tg_rp_top=>ty_base
      CHANGING
        cs_result TYPE zce_asset_tg_rp.

    CLASS-METHODS get_result_ztable
      IMPORTING
        is_base   TYPE zcl_ce_asset_tg_rp_top=>ty_base
        it_config TYPE zcl_ce_asset_tg_rp_top=>tt_config
      CHANGING
        cs_result TYPE zce_asset_tg_rp.

    CLASS-METHODS get_config
      IMPORTING
        it_bases  TYPE zcl_ce_asset_tg_rp_top=>tt_base
      EXPORTING
        et_config TYPE zcl_ce_asset_tg_rp_top=>tt_config.

    CLASS-METHODS get_giadauky
      IMPORTING
        ir_fromdate    TYPE ry_string
        ir_todate      TYPE ry_string
        it_keys        TYPE zcl_ce_asset_tg_rp_top=>tt_key
        it_keys_gia    TYPE zcl_ce_asset_tg_rp_top=>tt_key_gia
        iv_fiscalyear  TYPE string
        iv_periods     TYPE string
        iv_keydate     TYPE d
        ir_companycode TYPE ry_string
      EXPORTING
        et_giadaukya   TYPE zcl_ce_asset_tg_rp_top=>tt_gia_a
        et_giadaukyb   TYPE zcl_ce_asset_tg_rp_top=>tt_gia_b.

    CLASS-METHODS get_giadaukya
      IMPORTING
        it_keys       TYPE zcl_ce_asset_tg_rp_top=>tt_key
        iv_fiscalyear TYPE string
        iv_periods    TYPE string
        iv_keydate    TYPE d
        ir_fromdate   TYPE ry_string
        ir_todate     TYPE ry_string
      EXPORTING
        et_giadaukya  TYPE zcl_ce_asset_tg_rp_top=>tt_gia_a.

    CLASS-METHODS get_giadaukyb
      IMPORTING
        ir_fromdate    TYPE ry_string
        ir_todate      TYPE ry_string
        it_keys        TYPE zcl_ce_asset_tg_rp_top=>tt_key
        it_keys_gia    TYPE zcl_ce_asset_tg_rp_top=>tt_key_gia
        iv_fiscalyear  TYPE string
        iv_periods     TYPE string
        iv_keydate     TYPE d
        ir_companycode TYPE ry_string
      EXPORTING
        et_giadaukyb   TYPE zcl_ce_asset_tg_rp_top=>tt_gia_b.

    CLASS-METHODS get_params_giadaukyb
      IMPORTING
        ir_fromdate      TYPE ry_string
      EXPORTING
        er_b_postingdate TYPE ry_string.

    CLASS-METHODS get_temp_giadaukyb
      IMPORTING
        it_keys_gia       TYPE zcl_ce_asset_tg_rp_top=>tt_key_gia
        iv_fiscalyear     TYPE string
        iv_periods        TYPE string
        iv_keydate        TYPE d
        ir_b_postingdate  TYPE ry_string
      EXPORTING
        et_temp_giadaukyb TYPE zcl_ce_asset_tg_rp_top=>tt_temp_giadaukyb.

    CLASS-METHODS get_origin_rev_giadaukyb
      IMPORTING
        it_reversal_doc   TYPE zcl_ce_asset_tg_rp_top=>tt_reversal_doc
        ir_companycode    TYPE ry_string
        ir_b_postingdate  TYPE ry_string
      EXPORTING
        et_origin_rev_doc TYPE zcl_ce_asset_tg_rp_top=>tt_origin_rev_doc.

    CLASS-METHODS get_giadaukyb_final
      IMPORTING
        it_temp_giadaukyb TYPE zcl_ce_asset_tg_rp_top=>tt_temp_giadaukyb
      EXPORTING
        et_giadaukyb      TYPE zcl_ce_asset_tg_rp_top=>tt_gia_b.

    CLASS-METHODS get_result_gia
      IMPORTING
        it_giadaukya   TYPE zcl_ce_asset_tg_rp_top=>tt_gia_a
        it_giadaukyb   TYPE zcl_ce_asset_tg_rp_top=>tt_gia_b
        it_tanggiamgia TYPE zcl_ce_asset_tg_rp_top=>tt_tanggiamgia
        is_key         TYPE zcl_ce_asset_tg_rp_top=>ty_key
      CHANGING
        cs_result      TYPE zce_asset_tg_rp.

    CLASS-METHODS get_result_giadauky
      IMPORTING
        it_giadaukya TYPE zcl_ce_asset_tg_rp_top=>tt_gia_a
        it_giadaukyb TYPE zcl_ce_asset_tg_rp_top=>tt_gia_b
        is_key       TYPE zcl_ce_asset_tg_rp_top=>ty_key
      CHANGING
        cs_result    TYPE zce_asset_tg_rp.

    CLASS-METHODS get_tanggiamgia
      IMPORTING
        ir_fromdate    TYPE ry_string
        ir_todate      TYPE ry_string
        it_keys        TYPE zcl_ce_asset_tg_rp_top=>tt_key
        it_keys_gia    TYPE zcl_ce_asset_tg_rp_top=>tt_key_gia
        iv_fiscalyear  TYPE string
        iv_periods     TYPE string
        iv_keydate     TYPE d
        ir_companycode TYPE ry_string
      EXPORTING
        et_tanggiamgia TYPE zcl_ce_asset_tg_rp_top=>tt_tanggiamgia.

    CLASS-METHODS get_params_tanggiamgia
      IMPORTING
        ir_fromdate TYPE ry_string
        ir_todate   TYPE ry_string
      EXPORTING
        ev_fromdate TYPE string
        ev_todate   TYPE string.

    CLASS-METHODS get_temp_tanggiamgia
      IMPORTING
        it_keys_gia         TYPE zcl_ce_asset_tg_rp_top=>tt_key_gia
        iv_fiscalyear       TYPE string
        iv_periods          TYPE string
        iv_keydate          TYPE d
        iv_fromdate         TYPE string
        iv_todate           TYPE string
      EXPORTING
        et_temp_tanggiamgia TYPE zcl_ce_asset_tg_rp_top=>tt_temp_tanggiamgia.

    CLASS-METHODS get_origin_rev_tanggiamgia
      IMPORTING
        it_reversal_doc   TYPE zcl_ce_asset_tg_rp_top=>tt_reversal_doc
        ir_companycode    TYPE ry_string
        iv_fromdate       TYPE string
        iv_todate         TYPE string
      EXPORTING
        et_origin_rev_doc TYPE zcl_ce_asset_tg_rp_top=>tt_origin_rev_doc.

    CLASS-METHODS get_tanggiamgia_final
      IMPORTING
        it_temp_tanggiamgia TYPE zcl_ce_asset_tg_rp_top=>tt_temp_tanggiamgia
      EXPORTING
        et_tanggiamgia      TYPE zcl_ce_asset_tg_rp_top=>tt_tanggiamgia.

    CLASS-METHODS get_result_tanggiamgia
      IMPORTING
        it_tanggiamgia TYPE zcl_ce_asset_tg_rp_top=>tt_tanggiamgia
        is_key         TYPE zcl_ce_asset_tg_rp_top=>ty_key
      CHANGING
        cs_result      TYPE zce_asset_tg_rp.

    CLASS-METHODS get_result_giacuoiky
      CHANGING
        cs_result TYPE zce_asset_tg_rp.
ENDCLASS.



CLASS zcl_ce_asset_tg_rp_implement IMPLEMENTATION.
  METHOD select.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Build Params
    build_params( EXPORTING it_filters           = it_filters
                  IMPORTING er_companycode       = DATA(lr_COMPANYCODE)
                            er_depreciationareas = DATA(lr_DEPRECIATIONAREAS)
                            er_fiscalyear        = DATA(lr_FISCALYEAR)
                            er_periods           = DATA(lr_PERIODS)
                            er_assetnumber       = DATA(lr_ASSETNUMBER)
                            er_assetsubnumber    = DATA(lr_ASSETSUBNUMBER)
                            er_postingdate       = DATA(lr_POSTINGDATE)
                            ev_fiscalyear        = DATA(lv_fiscalyear)
                            ev_periods           = DATA(lv_periods)
                            er_fromdate          = DATA(lr_fromdate)
                            er_todate            = DATA(lr_todate)
                            ev_keydate           = DATA(lv_keydate)
                            er_loaitaisan        = DATA(lr_loaitaisan)
                            er_maphongban        = DATA(lr_maphongban) ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Build Main Data
    build_main_data( EXPORTING ir_companycode       = lr_companycode
                               ir_depreciationareas = lr_depreciationareas
                               ir_assetnumber       = lr_assetnumber
                               ir_assetsubnumber    = lr_assetsubnumber
                               ir_fiscalyear        = lr_fiscalyear
                               ir_postingdate       = lr_postingdate
                               ir_fromdate          = lr_fromdate
                               ir_todate            = lr_todate
                               iv_fiscalyear        = lv_fiscalyear
                               iv_periods           = lv_periods
                               iv_keydate           = lv_keydate
                               ir_loaitaisan        = lr_loaitaisan
                               ir_maphongban        = lr_maphongban
                     IMPORTING et_keys              = DATA(lt_keys)
                               et_keys_gia          = DATA(lt_keys_gia)
                               et_bases             = DATA(lt_bases)
                               et_giadaukya         = DATA(lt_giadaukya)
                               et_giadaukyb         = DATA(lt_giadaukyb)
                               et_tanggiamgia       = DATA(lt_tanggiamgia)
                               et_config            = DATA(lt_config) ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Get result
    get_result( EXPORTING it_keys           = lt_keys
                          it_bases          = lt_bases
                          it_giadaukya      = lt_giadaukya
                          it_giadaukyb      = lt_giadaukyb
                          it_tanggiamgia    = lt_tanggiamgia
                          it_config         = lt_config
                IMPORTING et_result         = et_result ).
  ENDMETHOD.



















  METHOD requested.
    TRY.
        et_filters = io_request->get_filter( )->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range.
        "handle exception
    ENDTRY.
  ENDMETHOD.

























  METHOD response.
    " ── a. AGGREGATION ──
    TRY.
        DATA(lo_aggregation) = io_request->get_aggregation( ).
        DATA(lt_group_by)    = lo_aggregation->get_grouped_elements( ).    " table of string
        DATA(lt_agg_elems)   = lo_aggregation->get_aggregated_elements( ). " table of ty_aggregation_element
      CATCH cx_rap_query_provider.
    ENDTRY.

    " ── b. RESPONSE ────────────────────────────────
    DATA(lv_total) = lines( ct_result ).

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( CONV int8( lv_total ) ).
    ENDIF.
    " ── c. HANDLE SORT ─────────────────────────────────────
    DATA(lt_sort) = io_request->get_sort_elements( ).
    IF lt_sort IS NOT INITIAL.
      DATA lt_sort_order TYPE abap_sortorder_tab.
      LOOP AT lt_sort INTO DATA(ls_sort).
        APPEND VALUE #(
            name       = ls_sort-element_name
            descending = ls_sort-descending
        ) TO lt_sort_order.
      ENDLOOP.
      SORT ct_result BY (lt_sort_order).
    ELSE.
      " Default sort
      SORT ct_result BY LoaiTaiSan MaTaiSan.
    ENDIF.

    LOOP AT ct_result ASSIGNING FIELD-SYMBOL(<lfs_result>).
      DATA(lv_tabix) = sy-tabix.
      <lfs_result>-ThuTu = lv_tabix.
    ENDLOOP.
    " ── d. PAGING ──────────────────────────────────────────
    DATA(lv_skip) = io_request->get_paging( )->get_offset( ).
    DATA(lv_top)  = io_request->get_paging( )->get_page_size( ).

    IF lv_top = if_rap_query_paging=>page_size_unlimited.
      lv_top = lv_total.
    ENDIF.

    IF lv_skip > 0.
      DELETE ct_result TO lv_skip.
    ENDIF.

    IF lv_top < lines( ct_result ).
      DELETE ct_result FROM lv_top + 1.
    ENDIF.

    io_response->set_data( ct_result ).
  ENDMETHOD.
























  METHOD build_params.
    "1.Get Params
    get_params( EXPORTING it_filters           = it_filters
                IMPORTING er_companycode       = er_COMPANYCODE
                          er_depreciationareas = er_DEPRECIATIONAREAS
                          er_fiscalyear        = er_FISCALYEAR
                          er_periods           = er_PERIODS
                          er_assetnumber       = er_ASSETNUMBER
                          er_assetsubnumber    = er_ASSETSUBNUMBER
                          er_postingdate       = er_POSTINGDATE
                          er_loaitaisan        = er_loaitaisan
                          er_maphongban        = er_maphongban ).


    "2.Build special Params
    build_special_params( EXPORTING ir_fiscalyear  = er_fiscalyear
                          IMPORTING ev_fiscalyear  = ev_fiscalyear
                                    ev_periods     = ev_periods
                                    er_fromdate    = er_fromdate
                                    er_todate      = er_todate
                                    ev_keydate     = ev_keydate
                           CHANGING cr_periods     = er_periods
                                    cr_postingdate = er_postingdate ).
  ENDMETHOD.




















  METHOD get_params.
    LOOP AT it_filters INTO DATA(ls_filter).
      CASE ls_filter-name.
        WHEN 'COMPANYCODE'.
          er_COMPANYCODE = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'DEPRECIATIONAREAS'.
          er_DEPRECIATIONAREAS = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'FISCALYEAR'.
          er_FISCALYEAR = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'PERIODS'.
          er_PERIODS = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'ASSETNUMBER'.
          er_ASSETNUMBER = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'ASSETSUBNUMBER'.
          er_ASSETSUBNUMBER = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'POSTINGDATE'.
          er_POSTINGDATE = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'LOAITAISAN'.
          er_loaitaisan = CORRESPONDING ry_string( ls_filter-range ).
          LOOP AT er_loaitaisan ASSIGNING FIELD-SYMBOL(<lfs_loaitaisan>).
            IF <lfs_loaitaisan>-low IS NOT INITIAL.
              <lfs_loaitaisan>-low = to_upper( <lfs_loaitaisan>-low ).
            ENDIF.
            IF <lfs_loaitaisan>-high IS NOT INITIAL.
              <lfs_loaitaisan>-high = to_upper( <lfs_loaitaisan>-high ).
            ENDIF.
          ENDLOOP.
        WHEN 'MAPHONGBAN'.
          er_MAPHONGBAN = CORRESPONDING ry_string( ls_filter-range ).
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.

















  METHOD build_special_params.
    "1. Modify Periods + Posting Date
    modify_periods_postingdate( EXPORTING ir_fiscalyear  = ir_fiscalyear
                                 CHANGING cr_periods     = cr_periods
                                          cr_postingdate = cr_postingdate ).
    "2. Get Fiscal year
    get_fiscal_year( EXPORTING ir_fiscalyear = ir_fiscalyear
                     IMPORTING ev_fiscalyear = ev_fiscalyear ).

    "3. Get Periods
    get_periods( EXPORTING ir_postingdate = cr_postingdate
                 IMPORTING ev_periods     = ev_periods ).

    "4. Build fromdate/todate: PostingDate ưu tiên, không có mới fallback theo Period
    get_fromto( EXPORTING ir_postingdate = cr_postingdate
                          ir_periods     = cr_periods
                          iv_fiscalyear  = ev_fiscalyear
                          iv_periods     = ev_periods
                IMPORTING er_fromdate    = er_fromdate
                          er_todate      = er_todate
                          ev_keydate     = ev_keydate ).
  ENDMETHOD.


























  METHOD get_fiscal_year.
    ev_fiscalyear = COND #( WHEN ir_FISCALYEAR[ 1 ]-high IS NOT INITIAL
                            THEN ir_FISCALYEAR[ 1 ]-high
                            ELSE ir_FISCALYEAR[ 1 ]-low ).
  ENDMETHOD.

























  METHOD get_fromto.
    APPEND INITIAL LINE TO er_fromdate ASSIGNING FIELD-SYMBOL(<lfs_fromdate>).
    <lfs_fromdate>-sign   = 'I'.
    <lfs_fromdate>-option = 'GE'.
    <lfs_fromdate>-low    = ir_postingdate[ 1 ]-low.

    ev_keydate = COND d( WHEN ir_postingdate[ 1 ]-high IS NOT INITIAL
                         THEN ir_postingdate[ 1 ]-high
                         ELSE ir_postingdate[ 1 ]-low ).
    DATA(lv_to_raw) = CONV d( ev_keydate + 1 ).

    APPEND INITIAL LINE TO er_todate ASSIGNING FIELD-SYMBOL(<lfs_todate>).
    <lfs_todate>-sign   = 'I'.
    <lfs_todate>-option = 'LT'.
    <lfs_todate>-low    = lv_to_raw.
  ENDMETHOD.





















  METHOD get_periods.
    ev_periods = COND #( WHEN ir_postingdate[ 1 ]-high IS NOT INITIAL
                         THEN ir_postingdate[ 1 ]-high+4(2)
                         ELSE ir_postingdate[ 1 ]-low+4(2) ).
  ENDMETHOD.



















  METHOD modify_periods_postingdate.
    "--- Nếu user điền CẢ 2 filter (Period lẫn PostingDate) --> check overlap ---
    validate_postingdate_periods( ir_fiscalyear  = ir_fiscalyear
                                  ir_postingdate = cr_postingdate
                                  ir_periods     = cr_periods ).

    "Nếu user không chọn Period --> mặc định full năm 001-012
    modify_periods( CHANGING cr_periods = cr_periods ).

    "Nếu user không điền posting date --> lấy ngày theo periods
    modify_postingdate( EXPORTING ir_fiscalyear  = ir_fiscalyear
                                  ir_periods     = cr_periods
                         CHANGING cr_postingdate = cr_postingdate ).
  ENDMETHOD.




















  METHOD modify_periods.
    IF cr_periods IS INITIAL.
      APPEND INITIAL LINE TO cr_periods ASSIGNING FIELD-SYMBOL(<lfs_periods>).
      <lfs_periods>-sign   = 'I'.
      <lfs_periods>-option = 'BT'.
      <lfs_periods>-low    = '001'.
      <lfs_periods>-high   = '012'.
    ENDIF.
  ENDMETHOD.

























  METHOD modify_postingdate.
    IF cr_postingdate IS INITIAL.
      APPEND INITIAL LINE TO cr_postingdate ASSIGNING FIELD-SYMBOL(<lfs_postingdate>).
      <lfs_postingdate>-sign   = 'I'.
      <lfs_postingdate>-option = 'BT'.

      "Low = ngày đầu tháng của period-low
      <lfs_postingdate>-low = |{ ir_fiscalyear[ 1 ]-low }{ ir_periods[ 1 ]-low+1(2) }01|.

      "High = ngày cuối tháng của period-high
      "Cách tính: lấy ngày đầu tháng KẾ TIẾP sau period-high, rồi trừ 1 ngày
      DATA(lv_high_period) = COND fins_fiscalperiod( WHEN ir_periods[ 1 ]-high IS NOT INITIAL
                                                     THEN ir_periods[ 1 ]-high
                                                     ELSE ir_periods[ 1 ]-low ).
      DATA(lv_high_year) = COND gjahr( WHEN ir_fiscalyear[ 1 ]-high IS NOT INITIAL
                                       THEN ir_fiscalyear[ 1 ]-high
                                       ELSE ir_fiscalyear[ 1 ]-low ).

      IF lv_high_period + 1 > 12.
        lv_high_period = 1.
        lv_high_year += 1.
      ELSE.
        lv_high_period += 1.
      ENDIF.

      DATA(lv_high_date) = CONV d( |{ lv_high_year }{ lv_high_period+1(2) }01| ).
      lv_high_date -= 1.

      <lfs_postingdate>-high = lv_high_date.
    ENDIF.
  ENDMETHOD.


























  METHOD validate_postingdate_periods.
    IF ir_postingdate IS NOT INITIAL AND ir_periods IS NOT INITIAL.
      " Tính khoảng ngày suy ra từ Period
      DATA(lv_year) = COND gjahr( WHEN ir_fiscalyear[ 1 ]-low IS NOT INITIAL
                                  THEN ir_fiscalyear[ 1 ]-low
                                  ELSE ir_fiscalyear[ 1 ]-high ).

      DATA(lv_period_from) = CONV d( |{ lv_year }{ ir_periods[ 1 ]-low+1(2) }01| ).

      DATA(lv_high_period) = COND poper( WHEN ir_periods[ 1 ]-high IS NOT INITIAL
                                         THEN ir_periods[ 1 ]-high
                                         ELSE ir_periods[ 1 ]-low ).
      DATA(lv_high_year) = COND gjahr( WHEN ir_fiscalyear[ 1 ]-high IS NOT INITIAL
                                       THEN ir_fiscalyear[ 1 ]-high
                                       ELSE ir_fiscalyear[ 1 ]-low ).
      IF lv_high_period + 1 > 12.
        lv_high_period = 1.
        lv_high_year += 1.
      ELSE.
        lv_high_period += 1.
      ENDIF.
      DATA(lv_period_to) = CONV d( |{ lv_high_year }{ lv_high_period+1(2) }01| ).
      lv_period_to -= 1.

      " Khoảng ngày user thực điền trên PostingDate
      DATA(lv_posting_from) = COND d( WHEN ir_postingdate[ 1 ]-low IS NOT INITIAL
                                      THEN ir_postingdate[ 1 ]-low
                                      ELSE ir_postingdate[ 1 ]-high ).
      DATA(lv_posting_to) = COND d( WHEN ir_postingdate[ 1 ]-high IS NOT INITIAL
                                    THEN ir_postingdate[ 1 ]-high
                                    ELSE ir_postingdate[ 1 ]-low ).

      " 2 khoảng KHÔNG giao nhau khi: posting_to < period_from HOẶC posting_from > period_to
      IF lv_posting_to < lv_period_from OR lv_posting_from > lv_period_to.
        RAISE EXCEPTION TYPE zcl_ce_asset_rp_implement
          EXPORTING
            textid = VALUE scx_t100key( msgid = 'ZMSG_ASSET_RP'
                                        msgno = '001' ).
      ENDIF.
    ENDIF.
  ENDMETHOD.


























  METHOD build_main_data.
    "1. Get key
    get_key( EXPORTING ir_companycode       = ir_companycode
                       ir_depreciationareas = ir_depreciationareas
                       ir_assetnumber       = ir_assetnumber
                       ir_assetsubnumber    = ir_assetsubnumber
                       ir_fiscalyear        = ir_fiscalyear
                       ir_postingdate       = ir_postingdate
                       ir_fromdate          = ir_fromdate
                       ir_todate            = ir_todate
                       iv_fiscalyear        = iv_fiscalyear
                       iv_periods           = iv_periods
                       iv_keydate           = iv_keydate
                       ir_loaitaisan        = ir_loaitaisan
                       ir_maphongban        = ir_maphongban
             IMPORTING et_keys              = et_keys
                       et_keys_gia          = et_keys_gia ).

    "2. Get base
    get_base( EXPORTING it_keys       = et_keys
                        iv_fiscalyear = iv_fiscalyear
                        iv_periods    = iv_periods
                        iv_keydate    = iv_keydate
              IMPORTING et_bases      = et_bases ).

    "3. Tính giá đầu kỳ (nguyên giá + hao mòn lũy kế)
    get_giadauky( EXPORTING ir_fromdate        = ir_fromdate
                            ir_todate          = ir_todate
                            it_keys            = et_keys
                            it_keys_gia        = et_keys_gia
                            iv_fiscalyear      = iv_fiscalyear
                            iv_periods         = iv_periods
                            iv_keydate         = iv_keydate
                            ir_companycode     = ir_companycode
                  IMPORTING et_giadaukya       = et_giadaukya
                            et_giadaukyb       = et_giadaukyb ).

    "4. Tăng - Giảm (Nguyên giá + Khấu hao)
    get_tanggiamgia( EXPORTING ir_fromdate      = ir_fromdate
                               ir_todate        = ir_todate
                               it_keys          = et_keys
                               it_keys_gia      = et_keys_gia
                               iv_fiscalyear    = iv_fiscalyear
                               iv_periods       = iv_periods
                               iv_keydate       = iv_keydate
                               ir_companycode   = ir_companycode
                     IMPORTING et_tanggiamgia   = et_tanggiamgia ).

    "5. Get Config from ZTable
    get_config( EXPORTING it_bases  = et_bases
                IMPORTING et_config = et_config ).
  ENDMETHOD.






















  METHOD get_result.
    LOOP AT it_keys INTO DATA(ls_key).
      DATA(lv_tabix) = sy-tabix.

      APPEND INITIAL LINE TO et_result ASSIGNING FIELD-SYMBOL(<lfs_result>).
      "Key fields
      get_result_key( EXPORTING is_key    = ls_key
                                iv_tabix  = lv_tabix
                       CHANGING cs_result = <lfs_result> ).

      READ TABLE it_bases INTO DATA(ls_base) WITH KEY CompanyCode       = ls_key-CompanyCode
                                                      DepreciationAreas = ls_key-depreciationareas
                                                      AssetNumber       = ls_key-AssetNumber
                                                      AssetSubNumber    = ls_key-AssetSubNumber
                                                      FiscalYear        = ls_key-FiscalYear.
      IF sy-subrc = 0.
        "Base fields
        get_result_base( EXPORTING is_base   = ls_base
                          CHANGING cs_result = <lfs_result> ).

        "ZTable (TK khấu hao + TK nguyên giá + TK hao mòn)
        get_result_ztable( EXPORTING is_base   = ls_base
                                     it_config = it_config
                            CHANGING cs_result = <lfs_result> ).
      ENDIF.

      "Giá
      get_result_gia( EXPORTING it_giadaukya   = it_giadaukya
                                it_giadaukyb   = it_giadaukyb
                                it_tanggiamgia = it_tanggiamgia
                                is_key         = ls_key
                       CHANGING cs_result      = <lfs_result> ).
    ENDLOOP.
  ENDMETHOD.




























  METHOD get_key.
    "1. Get key cho các field thường
    SELECT FROM I_AssetHistorySheetCube(
        p_assetaccountingkeyfigureset = 'AHS',
        p_fiscalyear                  = @iv_fiscalyear,
        P_FiscalPeriod                = @iv_periods,
        p_keydate                     = @iv_keydate
    ) AS a
    FIELDS
        a~CompanyCode,
        a~AssetDepreciationArea AS DepreciationAreas,
        a~MasterFixedAsset      AS AssetNumber,
        a~FixedAsset            AS AssetSubNumber,
        a~FiscalYear
     WHERE
        a~CompanyCode               IN @ir_companycode
        AND a~Ledger                = '0L'
        AND a~AssetDepreciationArea IN @ir_depreciationareas
        AND a~MasterFixedAsset      IN @ir_assetnumber
        AND a~FixedAsset            IN @ir_ASSETSUBNUMBER
        AND a~FiscalYear            IN @ir_FISCALYEAR
        AND a~AssetClass            IN @ir_loaitaisan
        AND a~AssetCostCenter       IN @ir_maphongban

        "Filtering logic asset
        "Logic lọc 1: Ví dụ chạy báo cáo từ tháng 7 → tháng 8. Thì lọc bỏ các tài sản có ngày Deactivation on < 01.07.2026
            "1.1. Nếu a~AssetDeactivationDate rỗng --> lấy
        AND ( a~AssetDeactivationDate IS INITIAL OR
            "1.2. Nếu a~AssetDeactivationDate khác rỗng --> check tiếp
            ( a~AssetDeactivationDate IS NOT INITIAL
            AND a~AssetDeactivationDate IN @ir_fromdate ) )
        "Logic lọc 2: Ví dụ chạy báo cáo từ tháng 01.07.2026 → 31.08.2026. Thì lọc bỏ các tài sản có ngày Capitalized on > 31.08.2026
            "2.1. Nếu a~AssetCapitalizationDate rỗng --> lấy
        AND ( a~AssetCapitalizationDate IS INITIAL OR
            "2.2. Nếu a~AssetCapitalizationDate khác rỗng --> check tiếp
            ( a~AssetCapitalizationDate IS NOT INITIAL
            AND a~AssetCapitalizationDate IN @ir_todate ) )
    GROUP BY
        a~CompanyCode,
        a~AssetDepreciationArea,
        a~MasterFixedAsset,
        a~FixedAsset,
        a~FiscalYear
    INTO TABLE @et_keys.

    "2. Get key cho các field tính giá (thêm group by theo accounting document)
    SELECT FROM I_AssetHistorySheetCube(
        p_assetaccountingkeyfigureset = 'AHS',
        p_fiscalyear                  = @iv_fiscalyear,
        P_FiscalPeriod                = @iv_periods,
        p_keydate                     = @iv_keydate
    ) AS a
    FIELDS
        a~CompanyCode,
        a~AssetDepreciationArea AS DepreciationAreas,
        a~MasterFixedAsset      AS AssetNumber,
        a~FixedAsset            AS AssetSubNumber,
        a~FiscalYear,
        a~AccountingDocument,
        a~LedgerGLLineItem
     WHERE
        a~CompanyCode               IN @ir_companycode
        AND a~Ledger                = '0L'
        AND a~AssetDepreciationArea IN @ir_depreciationareas
        AND a~MasterFixedAsset      IN @ir_assetnumber
        AND a~FixedAsset            IN @ir_ASSETSUBNUMBER
        AND a~FiscalYear            IN @ir_FISCALYEAR
        AND a~AssetClass            IN @ir_loaitaisan
        AND a~AssetCostCenter       IN @ir_maphongban

        "Filtering logic asset
        "Logic lọc 1: Ví dụ chạy báo cáo từ tháng 7 → tháng 8. Thì lọc bỏ các tài sản có ngày Deactivation on < 01.07.2026
            "1.1. Nếu a~AssetDeactivationDate rỗng --> lấy
        AND ( a~AssetDeactivationDate IS INITIAL OR
            "1.2. Nếu a~AssetDeactivationDate khác rỗng --> check tiếp
            ( a~AssetDeactivationDate IS NOT INITIAL
            AND a~AssetDeactivationDate IN @ir_fromdate ) )
        "Logic lọc 2: Ví dụ chạy báo cáo từ tháng 01.07.2026 → 31.08.2026. Thì lọc bỏ các tài sản có ngày Capitalized on > 31.08.2026
            "2.1. Nếu a~AssetCapitalizationDate rỗng --> lấy
        AND ( a~AssetCapitalizationDate IS INITIAL OR
            "2.2. Nếu a~AssetCapitalizationDate khác rỗng --> check tiếp
            ( a~AssetCapitalizationDate IS NOT INITIAL
            AND a~AssetCapitalizationDate IN @ir_todate ) )
    GROUP BY
        a~CompanyCode,
        a~AssetDepreciationArea,
        a~MasterFixedAsset,
        a~FixedAsset,
        a~FiscalYear,
        a~AccountingDocument,
        a~LedgerGLLineItem
    INTO TABLE @et_keys_gia.
  ENDMETHOD.

























  METHOD get_result_key.
    "Key fields
    cs_result-CompanyCode       = is_key-CompanyCode.
    cs_result-DepreciationAreas = is_key-DepreciationAreas.
    cs_result-AssetNumber       = is_key-AssetNumber.
    cs_result-AssetSubNumber    = is_key-AssetSubNumber.
    cs_result-FiscalYear        = is_key-FiscalYear.

    "Thứ tự
    cs_result-ThuTu = iv_tabix.

    "Mã tài sản
    DATA(lv_assetnumber) = |{ is_key-assetnumber ALPHA = OUT }|.
    DATA(lv_assetsubnumber) = |{ is_key-assetsubnumber ALPHA = OUT }|.

    CONDENSE: lv_assetnumber,
              lv_assetsubnumber.
    cs_result-MaTaiSan = |{ lv_assetnumber }-{ lv_assetsubnumber }|.
  ENDMETHOD.























  METHOD get_base.
    SELECT FROM @it_keys AS a
    LEFT JOIN I_AssetHistorySheetCube(
        p_assetaccountingkeyfigureset = 'AHS',
        p_fiscalyear                  = @iv_fiscalyear,
        P_FiscalPeriod                = @iv_periods,
        p_keydate                     = @iv_keydate
    ) AS b
        ON b~CompanyCode            = a~CompanyCode
        AND b~AssetDepreciationArea = a~DepreciationAreas
        AND b~MasterFixedAsset      = a~AssetNumber
        AND b~FixedAsset            = a~AssetSubNumber
        AND b~FiscalYear            = a~FiscalYear
    LEFT JOIN I_FixedAsset AS c
        ON c~CompanyCode = a~companycode
        AND c~MasterFixedAsset = a~assetnumber
        AND c~FixedAsset = a~assetsubnumber
    FIELDS
        "key fields
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear,

        "Tên tài sản
        b~\_MasterFixedAsset-MasterFixedAssetDescription,
        b~AssetAdditionalDescription,

        "Loại tài sản
        b~AssetClass AS LoaiTaiSan,
        b~\_AssetClass\_Text[ Language = @sy-langu ]-AssetClassDescription AS TenLoaiTaiSan,

        "Số kỳ khấu hao
        b~PlannedUsefulLifeInPeriods,
        b~PlannedUsefulLifeInYears,

        "Currency
        b~DisplayCurrency,

        "Phòng ban (Mã + Tên)
        b~AssetCostCenter AS MaPhongBan,
        b~\_AssetCostCenter\_Text[ Language = @sy-langu ]-CostCenterDescription AS TenPhongBan,

        "Ngày đưa vào sử dụng
        b~AssetCapitalizationDate AS NgayDuaVaoSuDung,

        "Địa điểm sử dụng
        c~YY1_EvaluationGroup1_FAA AS DiaDiemSuDung
    INTO TABLE @et_bases.
  ENDMETHOD.




























  METHOD get_result_base.
    "Tên tài sản
    cs_result-TenTaiSan = |{ is_base-MasterFixedAssetDescription } { is_base-AssetAdditionalDescription }|.

    "Loại tài sản
    cs_result-LoaiTaiSan    = is_base-LoaiTaiSan.
    cs_result-TenLoaiTaiSan = is_base-TenLoaiTaiSan.

    "Số kỳ khấu hao
    cs_result-SoKyKhauHao = is_base-PlannedUsefulLifeInYears * 12 + is_base-PlannedUsefulLifeInPeriods.

    "Currency
    cs_result-DisplayCurrency = is_base-DisplayCurrency.

    "Mã phòng ban
    cs_result-MaPhongBan = is_base-MaPhongBan.

    "Tên phòng ban
    cs_result-TenPhongBan = is_base-TenPhongBan.

    "Địa điểm sử dụng
    cs_result-DiaDiemSuDung = is_base-DiaDiemSuDung.

    "Ngày đưa vào sử dụng
    cs_result-NgayDuaVaoSuDung = is_base-NgayDuaVaoSuDung.
  ENDMETHOD.




















  METHOD get_result_ztable.
    cs_result-TaiKhoanNguyenGia = VALUE #( it_config[
        AccountDetermination = is_base-loaitaisan
        AccountAssignmentFor = 'KTANSW' ]-GlAccount OPTIONAL ) .

    cs_result-TaiKhoanHaoMon = VALUE #( it_config[
        AccountDetermination = is_base-loaitaisan
        AccountAssignmentFor = 'KTNAFB' ]-GlAccount OPTIONAL ) .

    cs_result-TaiKhoanKhauHao = VALUE #( it_config[
        AccountDetermination = is_base-loaitaisan
        AccountAssignmentFor = 'KTNAFG' ]-GlAccount OPTIONAL ).
  ENDMETHOD.






















  METHOD get_config.
    DATA(lt_bases_distinct) = it_bases.
    SORT lt_bases_distinct BY loaitaisan.
    DELETE ADJACENT DUPLICATES FROM lt_bases_distinct COMPARING loaitaisan.

    IF lt_bases_distinct IS INITIAL.
      RETURN.
    ENDIF.

    SELECT FROM zi_asset_rp
    FIELDS *
    FOR ALL ENTRIES IN @lt_bases_distinct
    WHERE
        AccountDetermination = @lt_bases_distinct-loaitaisan
        AND AccountAssignmentFor IN ( 'KTNAFG', 'KTNAFB', 'KTANSW' )
    INTO TABLE @et_config.
  ENDMETHOD.





























  METHOD get_giadauky.
    "Nguyên giá đầu kỳ A + Hao mòn lũy kế đầu kỳ A
    get_giadaukya( EXPORTING it_keys       = it_keys
                             iv_fiscalyear = iv_fiscalyear
                             iv_periods    = iv_periods
                             iv_keydate    = iv_keydate
                             ir_fromdate   = ir_fromdate
                             ir_todate     = ir_todate
                   IMPORTING et_giadaukya  = et_giadaukya ).

    "Nguyên giá đầu kỳ B + Hao mòn lũy kế đầu kỳ B
    get_giadaukyb( EXPORTING ir_fromdate    = ir_fromdate
                             ir_todate      = ir_todate
                             it_keys        = it_keys
                             it_keys_gia    = it_keys_gia
                             iv_fiscalyear  = iv_fiscalyear
                             iv_periods     = iv_periods
                             iv_keydate     = iv_keydate
                             ir_companycode = ir_companycode
                   IMPORTING et_giadaukyb   = et_giadaukyb ).
  ENDMETHOD.
































  METHOD get_giadaukya.
    DATA(lv_fromdate) = ir_fromdate[ 1 ]-low.
    DATA(lv_todate) = ir_todate[ 1 ]-low.

    SELECT FROM @it_keys AS a
    LEFT JOIN I_AssetHistorySheetCube(
          p_assetaccountingkeyfigureset = 'AHS',
          p_fiscalyear                  = @iv_fiscalyear,
          P_FiscalPeriod                = @iv_periods,
          p_keydate                     = @iv_keydate
      ) AS b
        ON b~CompanyCode            = a~CompanyCode
        AND b~AssetDepreciationArea = a~DepreciationAreas
        AND b~MasterFixedAsset      = a~AssetNumber
        AND b~FixedAsset            = a~AssetSubNumber
        AND b~FiscalYear            = a~FiscalYear
        AND b~Ledger                = '0L'
        AND b~CurrencyRole          = '10'
    FIELDS
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear,

        SUM( CASE
            WHEN b~AssetAccountingSortedKeyFigure = '000001-0000700110'
            THEN b~AmountInDisplayCurrency ELSE 0 END )
            AS NguyenGiaDauKyA,

        SUM( CASE
            WHEN b~AssetAccountingSortedKeyFigure = '000013-0000790200'
            THEN b~AmountInDisplayCurrency ELSE 0 END )
            AS KhauHaoDauKyA
    WHERE
        b~AssetAccountingSortedKeyFigure IN ( '000001-0000700110', '000013-0000790200' )
    GROUP BY
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear
    INTO TABLE @et_giadaukya.
  ENDMETHOD.


























  METHOD get_giadaukyb.
    CHECK it_keys_gia IS NOT INITIAL.

    "Bước 0: filter params cho et_giadaukyb
    get_params_giadaukyb( EXPORTING ir_fromdate      = ir_fromdate
                          IMPORTING er_b_postingdate = DATA(lr_b_postingdate) ).

    " Buoc 1: Lay ALL data, GROUP BY nhu cu (bao gom ca cac dong se bi loai)
    get_temp_giadaukyb( EXPORTING it_keys_gia       = it_keys_gia
                                  iv_fiscalyear     = iv_fiscalyear
                                  iv_periods        = iv_periods
                                  iv_keydate        = iv_keydate
                                  ir_b_postingdate  = lr_b_postingdate
                        IMPORTING et_temp_giadaukyb = DATA(lt_temp_giadaukyb) ).

    "Bước 2: Từ accounting document --> lấy được reversal referencedocument ở bảng I_GLAccountLineItemSemTag
    "Nếu là chứng từ hủy: type = 'WA' và IsReversal = 'X' --> logic như cũ
    "Nếu type <> 'WA' -->logic như cũ
    SELECT DISTINCT
        a~AccountingDocument,
        a~LedgerGLLineItem,

        a~ReversalReferenceDocument,
        a~FiscalYear,
        a~PostingDate
    FROM I_GLAccountLineItemSemTag AS a
    INNER JOIN @it_keys_gia AS b
        ON  a~AccountingDocument = b~accountingdocument
        AND a~LedgerGLLineItem = b~ledgergllineitem

        AND a~FiscalYear         = b~fiscalyear
        AND a~CompanyCode        = b~companycode
    WHERE
        a~Ledger              = '0L'
        AND a~SemanticTag     = 'ASSET'
        AND a~GLAccountHierarchy = 'ZBS'

        "case 1.1: type <> 'WA'
        AND ( a~AccountingDocumentType <> 'WA'
              AND ( a~IsReversal IS NOT INITIAL OR a~IsReversed IS NOT INITIAL )
        "case 1.2: type = 'WA' và IsReversal = 'X'
            OR ( a~AccountingDocumentType = 'WA' AND a~IsReversal = 'X' ) )
    INTO TABLE @DATA(lt_reversal_doc).

    "Bước 3: sau khi lấy được lt_reversal_doc --> lấy ngược lại original reversal doc ở I_Journalentry
    "Nếu I_Journalentry có ngày posting date nằm trong khoảng parameter thì loại khỏi et_tanggiamgia
    IF lt_reversal_doc IS NOT INITIAL.
      get_origin_rev_giadaukyb( EXPORTING it_reversal_doc   = lt_reversal_doc
                                          ir_companycode    = ir_companycode
                                          ir_b_postingdate  = lr_b_postingdate
                                IMPORTING et_origin_rev_doc = DATA(lt_origin_rev_doc) ).

      "Bước 4: Delete data của et_tanggiammgia
      LOOP AT lt_origin_rev_doc INTO DATA(ls_origin_rev_doc).
        DELETE lt_temp_giadaukyb WHERE companycode = ls_origin_rev_doc-CompanyCode
                                    AND fiscalyear = ls_origin_rev_doc-FiscalYear
                                    AND accountingdocument = ls_origin_rev_doc-AccountingDocument.
      ENDLOOP.
      IF lt_temp_giadaukyb IS NOT INITIAL.
        get_giadaukyb_final( EXPORTING it_temp_giadaukyb = lt_temp_giadaukyb
                             IMPORTING et_giadaukyb      = et_giadaukyb ).
      ENDIF.
    ENDIF.





    "Case 1.3: Nếu type = WA --> lấy data ở bảng I_MaterialDocumentItem_2
    "Nếu là chứng từ bị hủy: IsReversed = 'X' --> làm như dưới
    SELECT DISTINCT
        b~AccountingDocument AS doc_init,
        b~LedgerGLLineItem AS docitem_init,

        a~referencedocument AS AccountingDocument,
        a~referencedocumentitem AS LedgerGLLineItem,

        a~FiscalYear,
        a~PostingDate
    FROM I_GLAccountLineItemSemTag AS a
    INNER JOIN @it_keys_gia AS b
        ON  a~AccountingDocument = b~accountingdocument
        AND a~LedgerGLLineItem = b~ledgergllineitem

        AND a~FiscalYear         = b~fiscalyear
        AND a~CompanyCode        = b~companycode
    WHERE
        a~Ledger              = '0L'
        AND a~SemanticTag     = 'ASSET'
        AND a~GLAccountHierarchy = 'ZBS'
        AND ( a~IsReversal IS INITIAL AND a~IsReversed = 'X' )

        AND a~AccountingDocumentType = 'WA'
    INTO TABLE @DATA(lt_reversal_doc_wa).

    IF lt_reversal_doc_wa IS NOT INITIAL.
      SELECT FROM I_MaterialDocumentItem_2 AS a
      INNER JOIN @lt_reversal_doc_wa AS b
          ON b~AccountingDocument = a~ReversedMaterialDocument
          AND substring( b~ledgergllineitem, 3, 4 ) = a~ReversedMaterialDocumentItem
          AND b~FiscalYear = a~MaterialDocumentYear
      FIELDS
          b~doc_init,
          b~docitem_init,
          b~FiscalYear,

          a~MaterialDocument,
          a~MaterialDocumentItem,
          a~PostingDate
      WHERE
          a~PostingDate IN @lr_b_postingdate
      INTO TABLE @DATA(lt_origin_rev_doc_wa).

      "Từ matdoc --> lấy ngược lại để tìm được chứng từ gốc của chứng từ hủy
      SELECT FROM I_GLAccountLineItemSemTag AS a
      INNER JOIN @lt_origin_rev_doc_wa AS b
          ON b~FiscalYear = a~FiscalYear
          AND b~MaterialDocument = a~ReferenceDocument
          AND b~MaterialDocumentItem = substring( a~ReferenceDocumentItem, 3, 4 )
      FIELDS
          a~CompanyCode,
          a~FiscalYear,
          a~AccountingDocument,
          a~LedgerGLLineItem,
          a~PostingDate
      WHERE
          a~ledger = '0L'
          AND a~SemanticTag = 'ASSET'
          AND a~GLAccountHierarchy = 'ZBS'

          AND a~CompanyCode IN @ir_companycode
          AND a~PostingDate IN @lr_b_postingdate
      GROUP BY
          a~CompanyCode,
          a~FiscalYear,
          a~AccountingDocument,
          a~LedgerGLLineItem,
          a~PostingDate
      INTO TABLE @DATA(lt_origin_rev_doc_wa_2).

      IF lt_origin_rev_doc_wa IS NOT INITIAL.
        LOOP AT lt_origin_rev_doc_wa INTO DATA(ls_origin_rev_doc_wa).
          DELETE lt_temp_giadaukyb WHERE companycode = ir_companycode[ 1 ]-low
                                     AND fiscalyear = ls_origin_rev_doc_wa-FiscalYear
                                     AND accountingdocument = ls_origin_rev_doc_wa-doc_init
                                     AND ledgergllineitem = ls_origin_rev_doc_wa-docitem_init.
        ENDLOOP.
        IF lt_temp_giadaukyb IS NOT INITIAL.
          get_giadaukyb_final( EXPORTING it_temp_giadaukyb = lt_temp_giadaukyb
                               IMPORTING et_giadaukyb      = et_giadaukyb ).
        ENDIF.
      ENDIF.

      IF lt_origin_rev_doc_wa_2 IS NOT INITIAL.
        LOOP AT lt_origin_rev_doc_wa_2 INTO DATA(ls_origin_rev_doc_wa_2).
          DELETE lt_temp_giadaukyb WHERE companycode = ir_companycode[ 1 ]-low
                                     AND fiscalyear = ls_origin_rev_doc_wa_2-FiscalYear
                                     AND accountingdocument = ls_origin_rev_doc_wa_2-AccountingDocument
                                     AND LedgerGLLineItem = ls_origin_rev_doc_wa_2-LedgerGLLineItem.
        ENDLOOP.
      ENDIF.
      IF lt_temp_giadaukyb IS NOT INITIAL.
        get_giadaukyb_final( EXPORTING it_temp_giadaukyb = lt_temp_giadaukyb
                             IMPORTING et_giadaukyb      = et_giadaukyb ).
      ENDIF.
    ENDIF.
  ENDMETHOD.




























  METHOD get_params_giadaukyb.
    APPEND INITIAL LINE TO er_b_postingdate ASSIGNING FIELD-SYMBOL(<lfs_b_pdate>).
    <lfs_b_pdate>-sign   = 'I'.
    <lfs_b_pdate>-option = 'LT'.
    <lfs_b_pdate>-low    = ir_fromdate[ 1 ]-low.
  ENDMETHOD.


















  METHOD get_temp_giadaukyb.
    SELECT FROM @it_keys_gia AS a
    LEFT JOIN I_AssetHistorySheetCube(
        p_assetaccountingkeyfigureset = 'AHS',
        p_fiscalyear                  = @iv_fiscalyear,
        P_FiscalPeriod                = @iv_periods,
        p_keydate                     = @iv_keydate
    ) AS b
        ON b~CompanyCode            = a~CompanyCode
        AND b~AssetDepreciationArea = a~DepreciationAreas
        AND b~MasterFixedAsset      = a~AssetNumber
        AND b~FixedAsset            = a~AssetSubNumber
        AND b~FiscalYear            = a~FiscalYear
        AND b~AccountingDocument    = a~AccountingDocument
        AND b~ledgergllineitem      = a~ledgergllineitem
        AND b~Ledger                = '0L'
        AND b~CurrencyRole          = '10'
    FIELDS
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear,
        a~accountingdocument,
        a~ledgergllineitem,

        SUM( CASE WHEN b~AmountInDisplayCurrency IS NOT INITIAL
                       AND ( b~AssetAccountingSortedKeyFigure = '000002-0009790110' OR
                             b~AssetAccountingSortedKeyFigure = '000005-0005700000' OR
                             b~AssetAccountingSortedKeyFigure = '000006-0002700000' OR
                             b~AssetAccountingSortedKeyFigure = '000007-0009790300' )
            THEN b~AmountInDisplayCurrency ELSE 0 END ) AS NguyenGiaDauKyB,
        SUM( CASE WHEN b~AmountInDisplayCurrency IS NOT INITIAL
                       AND ( b~AssetAccountingSortedKeyFigure = '000014-0009790200' OR
                             b~AssetAccountingSortedKeyFigure = '000017-0009790600' OR
                             b~AssetAccountingSortedKeyFigure = '000018-0009790800' OR
                             b~AssetAccountingSortedKeyFigure = '000019-0009790700' OR
                             b~AssetAccountingSortedKeyFigure = '000020-0009790500' )
            THEN b~AmountInDisplayCurrency ELSE 0 END ) AS HaoMonLuyKeDauKyB
    WHERE
        b~PostingDate IN @ir_b_postingdate
        AND b~AssetAccountingSortedKeyFigure IN (  '000002-0009790110',
                                                   '000005-0005700000',
                                                   '000006-0002700000',
                                                   '000007-0009790300',
                                                   '000014-0009790200',
                                                   '000017-0009790600',
                                                   '000018-0009790800',
                                                   '000019-0009790700',
                                                   '000020-0009790500' )
    GROUP BY
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear,
        a~accountingdocument,
        a~ledgergllineitem
    INTO TABLE @et_temp_giadaukyb.
  ENDMETHOD.
















  METHOD get_origin_rev_giadaukyb.
    SELECT FROM I_JournalEntry AS a
    INNER JOIN @it_reversal_doc AS b
        ON b~FiscalYear = a~FiscalYear
        AND b~ReversalReferenceDocument = substring( a~OriginalReferenceDocument, 1, 10 )
    FIELDS
        a~CompanyCode,
        a~FiscalYear,
        a~AccountingDocument,
        a~OriginalReferenceDocument,
        a~PostingDate
    WHERE
        a~CompanyCode IN @ir_companycode
        AND b~PostingDate IN @ir_b_postingdate
        "case 1.1: type <> 'WA'
        AND ( a~AccountingDocumentType <> 'WA'
              AND ( a~IsReversal IS NOT INITIAL OR a~IsReversed IS NOT INITIAL )
        "case 1.2: type = 'WA' và IsReversal = 'X'
            OR ( a~AccountingDocumentType = 'WA' AND a~IsReversal = 'X' ) )
    INTO TABLE @et_origin_rev_doc.
  ENDMETHOD.






























  METHOD get_giadaukyb_final.
    SELECT FROM @it_temp_giadaukyb AS a
    FIELDS
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear,

        SUM( a~nguyengiadaukyb ) AS nguyengiadaukyb,
        SUM( a~haomonluykedaukyb ) AS haomonluykedaukyb
    GROUP BY
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear
    INTO TABLE @et_giadaukyb.
  ENDMETHOD.


























  METHOD get_result_gia.
    "Giá đầu kỳ (Nguyên giá + Hao mòn lũy kế)
    get_result_giadauky( EXPORTING it_giadaukya = it_giadaukya
                                   it_giadaukyb = it_giadaukyb
                                   is_key       = is_key
                          CHANGING cs_result    = cs_result ).

    "Tăng - Giảm (Nguyên giá + Hao mòn lũy kế + Giá trị khấu hao trong kỳ)
    get_result_tanggiamgia( EXPORTING it_tanggiamgia = it_tanggiamgia
                                      is_key         = is_key
                             CHANGING cs_result      = cs_result ).

    "Giá cuối kỳ
    get_result_giacuoiky( CHANGING cs_result = cs_result ).
  ENDMETHOD.























  METHOD get_result_giadauky.
    READ TABLE it_giadaukya INTO DATA(ls_nguyengiadaukya) WITH KEY CompanyCode       = is_key-CompanyCode
                                                                   DepreciationAreas = is_key-depreciationareas
                                                                   AssetNumber       = is_key-AssetNumber
                                                                   AssetSubNumber    = is_key-AssetSubNumber
                                                                   FiscalYear        = is_key-FiscalYear.
    IF sy-subrc = 0.
      DATA(lv_nguyengiadaukya)   = ls_nguyengiadaukya-nguyengiadaukya.
      DATA(lv_haomonluykedaukya) = ls_nguyengiadaukya-haomonluykedaukya.
    ENDIF.

    READ TABLE it_giadaukyb INTO DATA(ls_nguyengiadaukyb) WITH KEY CompanyCode       = is_key-CompanyCode
                                                                   DepreciationAreas = is_key-depreciationareas
                                                                   AssetNumber       = is_key-AssetNumber
                                                                   AssetSubNumber    = is_key-AssetSubNumber
                                                                   FiscalYear        = is_key-FiscalYear.
    IF sy-subrc = 0.
      DATA(lv_nguyengiadaukyb)   = ls_nguyengiadaukyb-nguyengiadaukyb.
      DATA(lv_haomonluykedaukyb) = ls_nguyengiadaukyb-haomonluykedaukyb.
    ENDIF.

    cs_result-NguyenGiaDauKy   = abs( lv_nguyengiadaukya + lv_nguyengiadaukyb ).
    cs_result-HaoMonLuyKeDauKy = abs( lv_haomonluykedaukya + lv_haomonluykedaukyb ).
    cs_result-GiaTriConLaiDauKy = cs_result-NguyenGiaDauKy - cs_result-HaoMonLuyKeDauKy.
  ENDMETHOD.



























  METHOD get_tanggiamgia.
    CHECK it_keys_gia IS NOT INITIAL.

    "Bước 0: filter params cho et_tanggiamgia
    get_params_tanggiamgia( EXPORTING ir_fromdate = ir_fromdate
                                      ir_todate   = ir_todate
                            IMPORTING ev_fromdate = DATA(lv_fromdate)
                                      ev_todate   = DATA(lv_todate) ).

    " Buoc 1: Lay ALL data, GROUP BY nhu cu (bao gom ca cac dong se bi loai)
    get_temp_tanggiamgia( EXPORTING it_keys_gia         = it_keys_gia
                                    iv_fiscalyear       = iv_fiscalyear
                                    iv_periods          = iv_periods
                                    iv_keydate          = iv_keydate
                                    iv_fromdate         = lv_fromdate
                                    iv_todate           = lv_todate
                          IMPORTING et_temp_tanggiamgia = DATA(lt_temp_tanggiamgia) ).

    "Bước 2: Từ accounting document --> lấy được reversal referencedocument ở bảng I_GLAccountLineItemSemTag
    "Nếu là chứng từ hủy: type = 'WA' và IsReversal = 'X' --> logic như cũ
    "Nếu type <> 'WA' -->logic như cũ
    SELECT DISTINCT
        a~AccountingDocument,
        a~LedgerGLLineItem,

        a~ReversalReferenceDocument,
        a~FiscalYear,
        a~PostingDate
    FROM I_GLAccountLineItemSemTag AS a
    INNER JOIN @it_keys_gia AS b
        ON  a~AccountingDocument = b~accountingdocument
        AND a~LedgerGLLineItem = b~ledgergllineitem

        AND a~FiscalYear         = b~fiscalyear
        AND a~CompanyCode        = b~companycode
    WHERE
        a~Ledger              = '0L'
        AND a~SemanticTag     = 'ASSET'
        AND a~GLAccountHierarchy = 'ZBS'

        "case 1.1: type <> 'WA'
        AND ( a~AccountingDocumentType <> 'WA'
              AND ( a~IsReversal IS NOT INITIAL OR a~IsReversed IS NOT INITIAL )
        "case 1.2: type = 'WA' và IsReversal = 'X'
            OR ( a~AccountingDocumentType = 'WA' AND a~IsReversal = 'X' ) )
    INTO TABLE @DATA(lt_reversal_doc).

    "Bước 3: sau khi lấy được lt_reversal_doc --> lấy ngược lại original reversal doc ở I_Journalentry
    "Nếu I_Journalentry có ngày posting date nằm trong khoảng parameter thì loại khỏi et_tanggiamgia
    IF lt_reversal_doc IS NOT INITIAL.
      get_origin_rev_tanggiamgia( EXPORTING it_reversal_doc   = lt_reversal_doc
                                            ir_companycode    = ir_companycode
                                            iv_fromdate       = lv_fromdate
                                            iv_todate         = lv_todate
                                  IMPORTING et_origin_rev_doc = DATA(lt_origin_rev_doc) ).

      "Bước 4: Delete data của et_tanggiammgia
      LOOP AT lt_origin_rev_doc INTO DATA(ls_origin_rev_doc).
        DELETE lt_temp_tanggiamgia WHERE companycode = ls_origin_rev_doc-CompanyCode
                                   AND fiscalyear = ls_origin_rev_doc-FiscalYear
                                   AND accountingdocument = ls_origin_rev_doc-AccountingDocument.
      ENDLOOP.
      IF lt_temp_tanggiamgia IS NOT INITIAL.
        get_tanggiamgia_final( EXPORTING it_temp_tanggiamgia = lt_temp_tanggiamgia
                               IMPORTING et_tanggiamgia      = et_tanggiamgia ).
      ENDIF.
    ENDIF.

    "Case 1.3: Nếu type = WA --> lấy data ở bảng I_MaterialDocumentItem_2
    "Nếu là chứng từ bị hủy: IsReversed = 'X' --> làm như dưới
    SELECT DISTINCT
        b~AccountingDocument AS doc_init,
        b~LedgerGLLineItem AS docitem_init,

        a~referencedocument AS AccountingDocument,
        a~referencedocumentitem AS LedgerGLLineItem,

        a~FiscalYear,
        a~PostingDate
    FROM I_GLAccountLineItemSemTag AS a
    INNER JOIN @it_keys_gia AS b
        ON  a~AccountingDocument = b~accountingdocument
        AND a~LedgerGLLineItem = b~ledgergllineitem

        AND a~FiscalYear         = b~fiscalyear
        AND a~CompanyCode        = b~companycode
    WHERE
        a~Ledger              = '0L'
        AND a~SemanticTag     = 'ASSET'
        AND a~GLAccountHierarchy = 'ZBS'
        AND ( a~IsReversal IS INITIAL AND a~IsReversed = 'X' )

        AND a~AccountingDocumentType = 'WA'
    INTO TABLE @DATA(lt_reversal_doc_wa).

    IF lt_reversal_doc_wa IS NOT INITIAL.
      SELECT FROM I_MaterialDocumentItem_2 AS a
      INNER JOIN @lt_reversal_doc_wa AS b
          ON b~AccountingDocument = a~ReversedMaterialDocument
          AND substring( b~ledgergllineitem, 3, 4 ) = a~ReversedMaterialDocumentItem
          AND b~FiscalYear = a~MaterialDocumentYear
      FIELDS
          b~doc_init,
          b~docitem_init,
          b~FiscalYear,

          a~MaterialDocument,
          a~MaterialDocumentItem,
          a~PostingDate
      WHERE
          a~PostingDate >= @lv_fromdate AND a~PostingDate < @lv_todate
      INTO TABLE @DATA(lt_origin_rev_doc_wa).

      "Từ matdoc --> lấy ngược lại để tìm được chứng từ gốc của chứng từ hủy
      SELECT FROM I_GLAccountLineItemSemTag AS a
      INNER JOIN @lt_origin_rev_doc_wa AS b
          ON b~FiscalYear = a~FiscalYear
          AND b~MaterialDocument = a~ReferenceDocument
          AND b~MaterialDocumentItem = substring( a~ReferenceDocumentItem, 3, 4 )
      FIELDS
          a~CompanyCode,
          a~FiscalYear,
          a~AccountingDocument,
          a~LedgerGLLineItem,
          a~PostingDate
      WHERE
          a~ledger = '0L'
          AND a~SemanticTag = 'ASSET'
          AND a~GLAccountHierarchy = 'ZBS'

          AND a~CompanyCode IN @ir_companycode
          AND ( a~PostingDate >= @lv_fromdate AND a~PostingDate < @lv_todate )
      GROUP BY
          a~CompanyCode,
          a~FiscalYear,
          a~AccountingDocument,
          a~LedgerGLLineItem,
          a~PostingDate
      INTO TABLE @DATA(lt_origin_rev_doc_wa_2).

      IF lt_origin_rev_doc_wa IS NOT INITIAL.
        LOOP AT lt_origin_rev_doc_wa INTO DATA(ls_origin_rev_doc_wa).
          DELETE lt_temp_tanggiamgia WHERE companycode = ir_companycode[ 1 ]-low
                                     AND fiscalyear = ls_origin_rev_doc_wa-FiscalYear
                                     AND accountingdocument = ls_origin_rev_doc_wa-doc_init
                                     AND ledgergllineitem = ls_origin_rev_doc_wa-docitem_init.
        ENDLOOP.
        IF lt_temp_tanggiamgia IS NOT INITIAL.
          get_tanggiamgia_final( EXPORTING it_temp_tanggiamgia = lt_temp_tanggiamgia
                                 IMPORTING et_tanggiamgia      = et_tanggiamgia ).
        ENDIF.
      ENDIF.

      IF lt_origin_rev_doc_wa_2 IS NOT INITIAL.
        LOOP AT lt_origin_rev_doc_wa_2 INTO DATA(ls_origin_rev_doc_wa_2).
          DELETE lt_temp_tanggiamgia WHERE companycode = ir_companycode[ 1 ]-low
                                     AND fiscalyear = ls_origin_rev_doc_wa_2-FiscalYear
                                     AND accountingdocument = ls_origin_rev_doc_wa_2-AccountingDocument
                                     AND ledgergllineitem = ls_origin_rev_doc_wa_2-LedgerGLLineItem.
        ENDLOOP.
      ENDIF.
      IF lt_temp_tanggiamgia IS NOT INITIAL.
        get_tanggiamgia_final( EXPORTING it_temp_tanggiamgia = lt_temp_tanggiamgia
                               IMPORTING et_tanggiamgia      = et_tanggiamgia ).
      ENDIF.
    ENDIF.
  ENDMETHOD.



























  METHOD get_params_tanggiamgia.
    ev_fromdate = ir_fromdate[ 1 ]-low.
    ev_todate = ir_todate[ 1 ]-low.
  ENDMETHOD.


























  METHOD get_temp_tanggiamgia.
    SELECT FROM @it_keys_gia AS a
    LEFT JOIN I_AssetHistorySheetCube(
        p_assetaccountingkeyfigureset = 'AHS',
        p_fiscalyear                  = @iv_fiscalyear,
        P_FiscalPeriod                = @iv_periods,
        p_keydate                     = @iv_keydate
        ) AS b
        ON b~CompanyCode            = a~CompanyCode
        AND b~AssetDepreciationArea = a~DepreciationAreas
        AND b~MasterFixedAsset      = a~AssetNumber
        AND b~FixedAsset            = a~AssetSubNumber
        AND b~FiscalYear            = a~FiscalYear
        AND b~AccountingDocument    = a~AccountingDocument
        AND b~ledgergllineitem      = a~ledgergllineitem
        AND b~Ledger                = '0L'
        AND b~CurrencyRole          = '10'
    FIELDS
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear,
        a~accountingdocument,
        a~ledgergllineitem,

        SUM( CASE WHEN b~AmountInDisplayCurrency IS NOT INITIAL
                       AND ( b~AssetAccountingSortedKeyFigure = '000002-0009790110' OR
                             b~AssetAccountingSortedKeyFigure = '000005-0005700000' OR
                             b~AssetAccountingSortedKeyFigure = '000006-0002700000' OR
                             b~AssetAccountingSortedKeyFigure = '000007-0009790300' )
                       AND b~AmountInDisplayCurrency > 0
            THEN b~AmountInDisplayCurrency ELSE 0 END ) AS TangNguyenGia,

        SUM( CASE WHEN b~AmountInDisplayCurrency IS NOT INITIAL
                       AND ( b~AssetAccountingSortedKeyFigure = '000002-0009790110' OR
                             b~AssetAccountingSortedKeyFigure = '000005-0005700000' OR
                             b~AssetAccountingSortedKeyFigure = '000006-0002700000' OR
                             b~AssetAccountingSortedKeyFigure = '000007-0009790300' )
                       AND b~AmountInDisplayCurrency < 0
            THEN b~AmountInDisplayCurrency ELSE 0 END ) AS GiamNguyenGia,

        SUM( CASE WHEN b~AmountInDisplayCurrency IS NOT INITIAL
                       AND ( b~AssetAccountingSortedKeyFigure = '000017-0009790600' OR
                             b~AssetAccountingSortedKeyFigure = '000018-0009790800' OR
                             b~AssetAccountingSortedKeyFigure = '000019-0009790700' OR
                             b~AssetAccountingSortedKeyFigure = '000020-0009790500' )
                       AND b~AmountInDisplayCurrency < 0
            THEN b~AmountInDisplayCurrency ELSE 0 END ) AS TangHaoMonLuyKe,

        SUM( CASE WHEN b~AmountInDisplayCurrency IS NOT INITIAL
                       AND ( b~AssetAccountingSortedKeyFigure = '000017-0009790600' OR
                             b~AssetAccountingSortedKeyFigure = '000018-0009790800' OR
                             b~AssetAccountingSortedKeyFigure = '000019-0009790700' OR
                             b~AssetAccountingSortedKeyFigure = '000020-0009790500' )
                       AND b~AmountInDisplayCurrency > 0
            THEN b~AmountInDisplayCurrency ELSE 0 END ) AS GiamHaoMonLuyKe,

        SUM( CASE WHEN b~AmountInDisplayCurrency IS NOT INITIAL
                       AND b~AssetAccountingSortedKeyFigure = '000014-0009790200'
                       AND b~AmountInDisplayCurrency > 0
            THEN b~AmountInDisplayCurrency ELSE 0 END ) AS GiaTriKhauHaoTrongKy
    WHERE
        ( b~PostingDate >= @iv_fromdate AND b~PostingDate < @iv_todate )
        AND b~AssetAccountingSortedKeyFigure IN (   '000002-0009790110',
                                                    '000005-0005700000',
                                                    '000006-0002700000',
                                                    '000007-0009790300',
                                                    '000014-0009790200',
                                                    '000017-0009790600',
                                                    '000018-0009790800',
                                                    '000019-0009790700',
                                                    '000020-0009790500' )
    GROUP BY
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear,
        a~accountingdocument,
        a~ledgergllineitem
    INTO TABLE @et_temp_tanggiamgia.
  ENDMETHOD.






















  METHOD get_origin_rev_tanggiamgia.
    SELECT FROM I_JournalEntry AS a
    INNER JOIN @it_reversal_doc AS b
        ON b~FiscalYear = a~FiscalYear
        AND b~ReversalReferenceDocument = substring( a~OriginalReferenceDocument, 1, 10 )
    FIELDS
        a~CompanyCode,
        a~FiscalYear,
        a~AccountingDocument,
        a~OriginalReferenceDocument,
        a~PostingDate
    WHERE
        a~CompanyCode IN @ir_companycode
        AND ( a~PostingDate >= @iv_fromdate AND a~PostingDate < @iv_todate )
        "case 1.1: type <> 'WA'
        AND ( a~AccountingDocumentType <> 'WA'
              AND ( a~IsReversal IS NOT INITIAL OR a~IsReversed IS NOT INITIAL )
        "case 1.2: type = 'WA' và IsReversal = 'X'
            OR ( a~AccountingDocumentType = 'WA' AND a~IsReversal = 'X' ) )
    INTO TABLE @et_origin_rev_doc.
  ENDMETHOD.

































  METHOD get_tanggiamgia_final.
    SELECT FROM @it_temp_tanggiamgia AS a
    FIELDS
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear,

        SUM( a~tangnguyengia ) AS tangnguyengia,
        SUM( a~giamnguyengia ) AS giamnguyengia,
        SUM( a~tanghaomonluyke ) AS tanghaomonluyke,
        SUM( a~giamhaomonluyke ) AS giamhaomonluyke,
        SUM( a~giatrikhauhaotrongky ) AS giatrikhauhaotrongky
    GROUP BY
        a~CompanyCode,
        a~DepreciationAreas,
        a~AssetNumber,
        a~AssetSubNumber,
        a~FiscalYear
    INTO TABLE @et_tanggiamgia.
  ENDMETHOD.



























  METHOD get_result_tanggiamgia.
    READ TABLE it_tanggiamgia INTO DATA(ls_tanggiamnguyengia) WITH KEY CompanyCode       = is_key-CompanyCode
                                                                       DepreciationAreas = is_key-depreciationareas
                                                                       AssetNumber       = is_key-AssetNumber
                                                                       AssetSubNumber    = is_key-AssetSubNumber
                                                                       FiscalYear        = is_key-FiscalYear.
    IF sy-subrc = 0.
      cs_result-TangNguyenGiaTrongKy   = abs( ls_tanggiamnguyengia-tangnguyengia ).
      cs_result-GiamNguyenGiaTrongKy   = abs( ls_tanggiamnguyengia-GiamNguyenGia ).
      cs_result-TangHaoMonLuyKeTrongKy = abs( ls_tanggiamnguyengia-TangHaoMonLuyKe ).
      cs_result-GiamHaoMonLuyKeTrongKy = abs( ls_tanggiamnguyengia-GiamHaoMonLuyKe ).
      cs_result-GiaTriKhauHaoTrongKy   = abs( ls_tanggiamnguyengia-GiaTriKhauHaoTrongKy ).

      cs_result-GiaTriConLaiTangTrongKy = cs_result-TangNguyenGiaTrongKy - cs_result-TangHaoMonLuyKeTrongKy.
      cs_result-NguyenGiaConLaiGiamTrongKy = cs_result-GiamNguyenGiaTrongKy - cs_result-GiamHaoMonLuyKeTrongKy.
    ENDIF.
  ENDMETHOD.





















  METHOD get_result_giacuoiky.
    "Nguyên giá cuối kỳ
    cs_result-NguyenGiaCuoiKy = cs_result-NguyenGiaDauKy
                                + cs_result-TangNguyenGiaTrongKy
                                - cs_result-GiamNguyenGiaTrongKy.

    "Khấu hao lũy kế cuối kỳ
    cs_result-KhauHaoLuyKeCuoiKy = cs_result-HaoMonLuyKeDauKy
                                   + cs_result-GiaTriKhauHaoTrongKy
                                   + cs_result-TangHaoMonLuyKeTrongKy
                                   - cs_result-GiamNguyenGiaTrongKy.

    "Giá trị còn lại cuối kỳ
    cs_result-GiaTriConLaiCuoiKy = cs_result-NguyenGiaCuoiKy
                                   - cs_result-HaoMonLuyKeDauKy.
  ENDMETHOD.
































ENDCLASS.
