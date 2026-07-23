CLASS zcl_ce_asset_tg_rp_top DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_key,
             CompanyCode       TYPE I_AssetHistorySheetCube-CompanyCode,
             DepreciationAreas TYPE I_AssetHistorySheetCube-AssetDepreciationArea,
             AssetNumber       TYPE I_AssetHistorySheetCube-MasterFixedAsset,
             AssetSubNumber    TYPE I_AssetHistorySheetCube-FixedAsset,
             FiscalYear        TYPE I_AssetHistorySheetCube-FiscalYear,
           END OF ty_key,
           tt_key TYPE STANDARD TABLE OF ty_key WITH EMPTY KEY.

    TYPES: BEGIN OF ty_key_gia,
             companycode        TYPE I_AssetHistorySheetCube-CompanyCode,
             depreciationareas  TYPE I_AssetHistorySheetCube-AssetDepreciationArea,
             assetnumber        TYPE I_AssetHistorySheetCube-MasterFixedAsset,
             assetsubnumber     TYPE I_AssetHistorySheetCube-FixedAsset,
             fiscalyear         TYPE I_AssetHistorySheetCube-FiscalYear,
             accountingdocument TYPE I_AssetHistorySheetCube-accountingdocument,
             LedgerGLLineItem   TYPE I_AssetHistorySheetCube-LedgerGLLineItem,
           END OF ty_key_gia,
           tt_key_gia TYPE STANDARD TABLE OF ty_key_gia WITH EMPTY KEY.

    TYPES: BEGIN OF ty_base,
             "key fields
             CompanyCode                 TYPE I_AssetHistorySheetCube-CompanyCode,
             DepreciationAreas           TYPE I_AssetHistorySheetCube-AssetDepreciationArea,
             AssetNumber                 TYPE I_AssetHistorySheetCube-MasterFixedAsset,
             AssetSubNumber              TYPE I_AssetHistorySheetCube-FixedAsset,
             FiscalYear                  TYPE I_AssetHistorySheetCube-FiscalYear,

             "Base fields
             MasterFixedAssetDescription TYPE I_MasterFixedAsset-MasterFixedAssetDescription,
             AssetAdditionalDescription  TYPE I_AssetHistorySheetCube-AssetAdditionalDescription,
             LoaiTaiSan                  TYPE I_AssetHistorySheetCube-AssetClass,
             TenLoaiTaiSan               TYPE I_AssetClassText-AssetClassDescription,
             PlannedUsefulLifeInPeriods  TYPE I_AssetHistorySheetCube-PlannedUsefulLifeInPeriods,
             PlannedUsefulLifeInYears    TYPE I_AssetHistorySheetCube-PlannedUsefulLifeInYears,
             DisplayCurrency             TYPE I_AssetHistorySheetCube-DisplayCurrency,
             MaPhongBan                  TYPE I_AssetHistorySheetCube-AssetCostCenter,
             TenPhongBan                 TYPE I_CostCenterText-CostCenterDescription,
             NgayDuaVaoSuDung            TYPE I_AssetHistorySheetCube-AssetCapitalizationDate,
             DiaDiemSuDung               TYPE I_FixedAsset-YY1_EvaluationGroup1_FAA,
             NgayBatDauKhauHao           TYPE I_AssetHistorySheetCube-DepreciationStartDate,
             NhaMay                      TYPE I_AssetHistorySheetCube-AssetPlant,
           END OF ty_base,
           tt_base TYPE STANDARD TABLE OF ty_base.

    TYPES: BEGIN OF ty_gia_a,
             CompanyCode       TYPE I_AssetHistorySheetCube-CompanyCode,
             DepreciationAreas TYPE I_AssetHistorySheetCube-AssetDepreciationArea,
             AssetNumber       TYPE I_AssetHistorySheetCube-MasterFixedAsset,
             AssetSubNumber    TYPE I_AssetHistorySheetCube-FixedAsset,
             FiscalYear        TYPE I_AssetHistorySheetCube-FiscalYear,
             NguyenGiaDauKyA   TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             HaoMonLuyKeDauKyA TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
           END OF ty_gia_a,
           tt_gia_a TYPE STANDARD TABLE OF ty_gia_a.

    TYPES: BEGIN OF ty_gia_b,
             CompanyCode       TYPE I_AssetHistorySheetCube-CompanyCode,
             DepreciationAreas TYPE I_AssetHistorySheetCube-AssetDepreciationArea,
             AssetNumber       TYPE I_AssetHistorySheetCube-MasterFixedAsset,
             AssetSubNumber    TYPE I_AssetHistorySheetCube-FixedAsset,
             FiscalYear        TYPE I_AssetHistorySheetCube-FiscalYear,
             NguyenGiaDauKyB   TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             HaoMonLuyKeDauKyB TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
           END OF ty_gia_b,
           tt_gia_b TYPE STANDARD TABLE OF ty_gia_b.

    TYPES: BEGIN OF ty_tanggiamgia,
             CompanyCode          TYPE I_AssetHistorySheetCube-CompanyCode,
             DepreciationAreas    TYPE I_AssetHistorySheetCube-AssetDepreciationArea,
             AssetNumber          TYPE I_AssetHistorySheetCube-MasterFixedAsset,
             AssetSubNumber       TYPE I_AssetHistorySheetCube-FixedAsset,
             FiscalYear           TYPE I_AssetHistorySheetCube-FiscalYear,
             TangNguyenGia        TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             GiamNguyenGia        TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             TangHaoMonLuyKe      TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             GiamHaoMonLuyKe      TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             GiaTriKhauHaoTrongKy TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
           END OF ty_tanggiamgia,
           tt_tanggiamgia TYPE STANDARD TABLE OF ty_tanggiamgia.

    TYPES: tt_config TYPE HASHED TABLE OF zi_asset_rp
         WITH UNIQUE KEY AccountDetermination AccountAssignmentFor.

    TYPES: BEGIN OF ty_temp_giadaukyb,
             companycode        TYPE I_AssetHistorySheetCube-companycode,
             depreciationareas  TYPE I_AssetHistorySheetCube-AssetDepreciationArea,
             assetnumber        TYPE I_AssetHistorySheetCube-MasterFixedAsset,
             assetsubnumber     TYPE I_AssetHistorySheetCube-FixedAsset,
             fiscalyear         TYPE I_AssetHistorySheetCube-FiscalYear,
             accountingdocument TYPE I_AssetHistorySheetCube-AccountingDocument,
             LedgerGLLineItem   TYPE I_AssetHistorySheetCube-LedgerGLLineItem,
             nguyengiadaukyb    TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             haomonluykedaukyb  TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
           END OF ty_temp_giadaukyb,
           tt_temp_giadaukyb TYPE STANDARD TABLE OF ty_temp_giadaukyb WITH EMPTY KEY.

    TYPES: BEGIN OF ty_reversal_doc,
             AccountingDocument        TYPE I_GLAccountLineItemSemTag-AccountingDocument,
             AccountingDocumentItem    TYPE I_GLAccountLineItemSemTag-LedgerGLLineItem,
             ReversalReferenceDocument TYPE I_GLAccountLineItemSemTag-ReversalReferenceDocument,
             FiscalYear                TYPE I_GLAccountLineItemSemTag-FiscalYear,
             postingdate               TYPE I_GLAccountLineItemSemTag-postingdate,
           END OF ty_reversal_doc,
           tt_reversal_doc TYPE STANDARD TABLE OF ty_reversal_doc WITH EMPTY KEY.

    TYPES: BEGIN OF ty_origin_rev_doc,
             CompanyCode               TYPE I_JournalEntry-CompanyCode,
             FiscalYear                TYPE I_JournalEntry-FiscalYear,
             AccountingDocument        TYPE I_JournalEntry-AccountingDocument,
             OriginalReferenceDocument TYPE I_JournalEntry-OriginalReferenceDocument,
             PostingDate               TYPE I_JournalEntry-PostingDate,
           END OF ty_origin_rev_doc,
           tt_origin_rev_doc TYPE STANDARD TABLE OF ty_origin_rev_doc.

    TYPES: BEGIN OF ty_temp_tanggiamgia,
             companycode          TYPE I_AssetHistorySheetCube-companycode,
             depreciationareas    TYPE I_AssetHistorySheetCube-AssetDepreciationArea,
             assetnumber          TYPE I_AssetHistorySheetCube-MasterFixedAsset,
             assetsubnumber       TYPE I_AssetHistorySheetCube-FixedAsset,
             fiscalyear           TYPE I_AssetHistorySheetCube-FiscalYear,
             accountingdocument   TYPE I_AssetHistorySheetCube-AccountingDocument,
             LedgerGLLineItem     TYPE I_AssetHistorySheetCube-LedgerGLLineItem,
             TangNguyenGia        TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             GiamNguyenGia        TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             TangHaoMonLuyKe      TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             GiamHaoMonLuyKe      TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
             GiaTriKhauHaoTrongKy TYPE I_AssetHistorySheetCube-AmountInDisplayCurrency,
           END OF ty_temp_tanggiamgia,
           tt_temp_tanggiamgia TYPE STANDARD TABLE OF ty_temp_tanggiamgia WITH EMPTY KEY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ce_asset_tg_rp_top IMPLEMENTATION.
ENDCLASS.
