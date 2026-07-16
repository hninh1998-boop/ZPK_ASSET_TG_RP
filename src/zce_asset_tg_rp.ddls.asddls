@EndUserText.label: 'Custom Entity - TG TSCĐ'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CE_ASSET_TG_RP'
@Metadata.allowExtensions: true
define custom entity zce_asset_tg_rp
{
      // I_AssetHistorySheetCube
  key CompanyCode                : bukrs; // CompanyCode
  key DepreciationAreas          : abap.numc(2); // AssetDepreciationArea
  key AssetNumber                : anln1; // MasterFixedAsset
  key AssetSubNumber             : anln2; // FixedAsset
  key FiscalYear                 : fis_gjahr_no_conv; // FiscalYear
  key ThuTu                      : abap.int4;
      MaTaiSan                   : abap.char(17); // MasterFixedAsset + FixedAsset
      TenTaiSan                  : abap.string;
      @ObjectModel.text.element  : [ 'TenLoaiTaiSan' ]
      LoaiTaiSan                 : abap.char(8);  // AssetClass
      TenLoaiTaiSan              : abap.char(50); // I_AssetHistorySheetCube\_AssetClass\_Text-AssetClassDescription
      MaPhongBan                 : kostl; //AssetCostCenter
      TenPhongBan                : abap.char(40); // I_AssetHistorySheetCube\_AssetCostCenter\_Text-CostCenterDescription
      NgayDuaVaoSuDung           : abap.dats; // AssetCapitalizationDate

      // I_FixedAsset
      DiaDiemSuDung              : abap.char(20); // YY1_EvaluationGroup1_FAA

      //Get by Logic
      SoKyKhauHao                : abap.numc(3);
      SoKyConLai                 : abap.numc(3);

      // Currency Field ( AmountInDisplayCurrency )
      DisplayCurrency            : vdm_v_display_currency; // DisplayCurrency
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      NguyenGiaDauKy             : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      HaoMonLuyKeDauKy           : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      GiaTriConLaiDauKy          : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      TangNguyenGiaTrongKy       : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      TangHaoMonLuyKeTrongKy     : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      GiaTriConLaiTangTrongKy    : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      GiamNguyenGiaTrongKy       : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      GiamHaoMonLuyKeTrongKy     : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      NguyenGiaConLaiGiamTrongKy : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      GiaTriKhauHaoTrongKy       : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      NguyenGiaCuoiKy            : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      KhauHaoLuyKeCuoiKy         : abap.curr(23,2);
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      GiaTriConLaiCuoiKy         : abap.curr(23,2);

      //Z Table
      TaiKhoanKhauHao            : saknr;
      TaiKhoanNguyenGia          : saknr;
      TaiKhoanHaoMon             : saknr;

      //Only for params
      PostingDate                : fis_budat;
      Periods                    : fins_fiscalperiod; // FiscalPeriod

}
