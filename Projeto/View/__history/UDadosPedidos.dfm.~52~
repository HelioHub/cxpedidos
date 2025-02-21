object FDadosPedidos: TFDadosPedidos
  Left = 0
  Top = 0
  ActiveControl = DTPDataEmissao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados do Pedido'
  ClientHeight = 334
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 13
  object PRodape: TPanel
    Left = 0
    Top = 293
    Width = 599
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      599
      41)
    object BBSair: TBitBtn
      Left = 513
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight]
      Cancel = True
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BBSairClick
    end
    object BBGravar: TBitBtn
      Left = 430
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Gravar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BBGravarClick
    end
  end
  object PDados: TPanel
    Left = 0
    Top = 0
    Width = 599
    Height = 123
    Align = alClient
    TabOrder = 1
    object LDT: TLabel
      Left = 30
      Top = 41
      Width = 83
      Height = 13
      Caption = 'Data de Emiss'#227'o:'
    end
    object LT: TLabel
      Left = 182
      Top = 68
      Width = 4
      Height = 13
      Caption = '-'
    end
    object SBF2: TSpeedButton
      Left = 487
      Top = 63
      Width = 107
      Height = 22
      Caption = 'F2 -Concultar Cliente'
      StyleName = 'Windows'
      OnClick = SBF2Click
    end
    object LENumeroPedido: TLabeledEdit
      Left = 116
      Top = 10
      Width = 61
      Height = 21
      EditLabel.Width = 94
      EditLabel.Height = 21
      EditLabel.Caption = ' N'#250'mero do Pedido:'
      Enabled = False
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
      Text = ''
    end
    object DTPDataEmissao: TDateTimePicker
      Left = 116
      Top = 37
      Width = 85
      Height = 21
      Date = 45686.000000000000000000
      Time = 0.829977719906310100
      TabOrder = 1
    end
    object LECodigoCliente: TLabeledEdit
      Left = 116
      Top = 64
      Width = 61
      Height = 21
      EditLabel.Width = 88
      EditLabel.Height = 21
      EditLabel.Caption = 'C'#243'digo do Cliente:'
      Enabled = False
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 2
      Text = ''
    end
    object EDescCliente: TEdit
      Left = 191
      Top = 64
      Width = 292
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object LETotalPedido: TLabeledEdit
      Left = 116
      Top = 91
      Width = 109
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 78
      EditLabel.Height = 21
      EditLabel.Caption = 'Total do Pedido:'
      Enabled = False
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 4
      Text = ''
    end
  end
  object PItensPedido: TPanel
    Left = 0
    Top = 123
    Width = 599
    Height = 15
    Align = alBottom
    Alignment = taLeftJustify
    Caption = '   Itens do Pedido:'
    TabOrder = 2
  end
  object POpcoes: TPanel
    Left = 0
    Top = 266
    Width = 599
    Height = 27
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      599
      27)
    object BBInc: TBitBtn
      Left = 10
      Top = 2
      Width = 75
      Height = 22
      Anchors = [akRight]
      Caption = '&Incluir'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BBIncClick
    end
    object BBAlt: TBitBtn
      Left = 91
      Top = 2
      Width = 75
      Height = 22
      Anchors = [akRight]
      Caption = '&Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BBAltClick
    end
    object BBExc: TBitBtn
      Left = 172
      Top = 2
      Width = 75
      Height = 22
      Anchors = [akRight]
      Caption = '&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = BBExcClick
    end
  end
  object PView: TPanel
    Left = 0
    Top = 138
    Width = 599
    Height = 128
    Align = alBottom
    TabOrder = 4
    object DBGView: TDBGrid
      Left = 1
      Top = 1
      Width = 597
      Height = 126
      Hint = 'Duplo Click para Alterar o Item do Pedido...'
      Align = alClient
      DataSource = DSDadosItensPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGViewDblClick
      OnKeyDown = DBGViewKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'idItensPedido'
          Title.Caption = 'Id'
          Width = 29
          Visible = True
        end
        item
          Color = clSnow
          Expanded = False
          FieldName = 'ProdutoItensPedido'
          Title.Caption = 'Item'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescricaoProdutos'
          Title.Caption = 'Descri'#231#227'o do Item'
          Width = 225
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuantidadeItensPedido'
          Title.Alignment = taRightJustify
          Title.Caption = 'Quantidade'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrUnitarioItensPedido'
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o Venda'
          Width = 90
          Visible = True
        end
        item
          Color = clSnow
          Expanded = False
          FieldName = 'VlrTotalItensPedido'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Total'
          Width = 90
          Visible = True
        end>
    end
  end
  object DSDadosItensPedido: TDataSource
    DataSet = ItensPedidoMemTable
    Left = 224
    Top = 192
  end
  object ItensPedidoMemTable: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 328
    Top = 192
    object ItensPedidoMemTableidItensPedido: TIntegerField
      FieldName = 'idItensPedido'
    end
    object ItensPedidoMemTablePedidoItensPedido: TIntegerField
      FieldName = 'PedidoItensPedido'
    end
    object ItensPedidoMemTableProdutoItensPedido: TIntegerField
      FieldName = 'ProdutoItensPedido'
    end
    object ItensPedidoMemTableQuantidadeItensPedido: TBCDField
      FieldName = 'QuantidadeItensPedido'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
    object ItensPedidoMemTableVlrUnitarioItensPedido: TBCDField
      FieldName = 'VlrUnitarioItensPedido'
      DisplayFormat = '###,##0.00'
      Size = 3
    end
    object ItensPedidoMemTableVlrTotalItensPedido: TBCDField
      FieldName = 'VlrTotalItensPedido'
      DisplayFormat = '###,##0.00'
      Size = 3
    end
    object ItensPedidoMemTableDescricaoProdutos: TStringField
      FieldName = 'DescricaoProdutos'
      Size = 80
    end
  end
end
