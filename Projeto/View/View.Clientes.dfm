object FViewClientes: TFViewClientes
  Left = 0
  Top = 0
  ActiveControl = LEFiltroCodigoCliente
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Clientes'
  ClientHeight = 387
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object PHead: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 44
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 641
    DesignSize = (
      638
      44)
    object LNR: TLabel
      Left = 524
      Top = 16
      Width = 73
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'N'#186' Registros:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 527
    end
    object BBIncluir: TBitBtn
      Left = 5
      Top = 8
      Width = 63
      Height = 30
      Hint = 'Incluir Pedido'
      Caption = '&Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 0
      Images = DMUtils.ILImagensSystem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BBIncluirClick
    end
    object BBAlterar: TBitBtn
      Left = 72
      Top = 8
      Width = 63
      Height = 30
      Hint = 'Alterar Pedido'
      Caption = '&Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 1
      Images = DMUtils.ILImagensSystem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BBAlterarClick
    end
    object BBExcluir: TBitBtn
      Left = 139
      Top = 8
      Width = 63
      Height = 30
      Hint = 'Cancela o Pedido e seus Itens deletandos'
      Caption = '&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 2
      Images = DMUtils.ILImagensSystem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BBExcluirClick
    end
    object BBSair: TBitBtn
      Left = 206
      Top = 8
      Width = 63
      Height = 30
      Hint = 'Fechar tela de Pedidos'
      Cancel = True
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 8
      Images = DMUtils.ILImagensSystem
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BBSairClick
    end
    object ENR: TEdit
      Left = 599
      Top = 13
      Width = 33
      Height = 21
      Hint = 'Limite de registros da Consulta. Colocando zero desconsidera.'
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 5
      Text = '100'
      ExplicitLeft = 602
    end
    object BBRelatorio: TBitBtn
      Left = 427
      Top = 8
      Width = 80
      Height = 30
      Hint = 
        'Gera Relat'#243'rio em HTML dos Pedidos. Considera o Filtro Data de E' +
        'miss'#227'o.'
      Cancel = True
      Caption = 'Rela&t'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 4
      Images = DMUtils.ILImagensSystem
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BBRelatorioClick
    end
  end
  object PRodape: TPanel
    Left = 0
    Top = 288
    Width = 638
    Height = 99
    Align = alBottom
    Alignment = taLeftJustify
    TabOrder = 3
    ExplicitTop = 287
    object LNomeFant: TLabel
      Left = 4
      Top = 6
      Width = 75
      Height = 13
      Caption = 'Nome Fantasia:'
    end
    object LEnd: TLabel
      Left = 30
      Top = 30
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object LBairro: TLabel
      Left = 47
      Top = 78
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object LLong: TLabel
      Left = 449
      Top = 7
      Width = 51
      Height = 13
      Caption = 'Longitude:'
    end
    object LLati: TLabel
      Left = 457
      Top = 30
      Width = 43
      Height = 13
      Caption = 'Latitude:'
    end
    object LCIBGE: TLabel
      Left = 422
      Top = 54
      Width = 78
      Height = 13
      Caption = 'Codigo do IBGE:'
    end
    object LNum: TLabel
      Left = 38
      Top = 54
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object LSituacao: TLabel
      Left = 404
      Top = 78
      Width = 96
      Height = 13
      Caption = 'Situa'#231#227'o do Cliente:'
    end
    object DBENF: TDBEdit
      Left = 85
      Top = 3
      Width = 298
      Height = 21
      DataField = 'NomeFantasiaClientes'
      DataSource = DSViewClientes
      ReadOnly = True
      TabOrder = 0
    end
    object DBEEnd: TDBEdit
      Left = 85
      Top = 26
      Width = 298
      Height = 21
      DataField = 'RuaClientes'
      DataSource = DSViewClientes
      ReadOnly = True
      TabOrder = 1
    end
    object DBEBairro: TDBEdit
      Left = 85
      Top = 74
      Width = 220
      Height = 21
      DataField = 'BairroClientes'
      DataSource = DSViewClientes
      ReadOnly = True
      TabOrder = 3
    end
    object DBELong: TDBEdit
      Left = 502
      Top = 3
      Width = 131
      Height = 21
      DataField = 'LongitudeClientes'
      DataSource = DSViewClientes
      ReadOnly = True
      TabOrder = 4
    end
    object DBELati: TDBEdit
      Left = 502
      Top = 26
      Width = 131
      Height = 21
      DataField = 'LatitudeClientes'
      DataSource = DSViewClientes
      ReadOnly = True
      TabOrder = 5
    end
    object DBECIBGE: TDBEdit
      Left = 502
      Top = 50
      Width = 73
      Height = 21
      DataField = 'CodIBGEClientes'
      DataSource = DSViewClientes
      ReadOnly = True
      TabOrder = 6
    end
    object DBENum: TDBEdit
      Left = 85
      Top = 50
      Width = 76
      Height = 21
      DataField = 'NumeroRuaClientes'
      DataSource = DSViewClientes
      ReadOnly = True
      TabOrder = 2
    end
    object DBESituacao: TDBEdit
      Left = 502
      Top = 74
      Width = 122
      Height = 21
      Color = clRed
      DataField = 'SitCadastralClientes'
      DataSource = DSViewClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  object PViewPedidos: TPanel
    Left = 0
    Top = 96
    Width = 638
    Height = 192
    Align = alClient
    TabOrder = 2
    ExplicitHeight = 209
    object PDados: TPanel
      Left = 1
      Top = 1
      Width = 636
      Height = 190
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 41
      ExplicitWidth = 481
      ExplicitHeight = 195
      object DBGView: TDBGrid
        Left = 1
        Top = 1
        Width = 634
        Height = 188
        Hint = 'Duplo Click para Selecionar Cliente...'
        Align = alClient
        DataSource = DSViewClientes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
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
            FieldName = 'CodigoClientes'
            Title.Caption = 'C'#243'digo '
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJClientes'
            Title.Caption = 'CNPJ'
            Width = 104
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'NomeClientes'
            Title.Caption = 'Raz'#227'o Social'
            Width = 219
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEPClientes'
            Title.Caption = 'CEP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CidadeClientes'
            Title.Caption = 'Cidade'
            Width = 136
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UFClientes'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Width = 33
            Visible = True
          end>
      end
    end
  end
  object PFiltrar: TPanel
    Left = 0
    Top = 44
    Width = 638
    Height = 52
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 641
    DesignSize = (
      638
      52)
    object SBClearPedido: TSpeedButton
      Left = 198
      Top = 3
      Width = 23
      Height = 22
      Hint = 'Limpar Pedido'
      ImageIndex = 7
      Images = DMUtils.ILImagensSystem
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBClearPedidoClick
    end
    object SBClearNomeCliente: TSpeedButton
      Left = 479
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Limpar Nome do Cliente'
      ImageIndex = 7
      Images = DMUtils.ILImagensSystem
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBClearNomeClienteClick
    end
    object LEFiltroCodigoCliente: TLabeledEdit
      Left = 150
      Top = 3
      Width = 46
      Height = 21
      EditLabel.Width = 142
      EditLabel.Height = 21
      EditLabel.Caption = 'Filtrar por N'#250'mero do Cliente:'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
      Text = ''
    end
    object LEFiltroNomeCliente: TLabeledEdit
      Left = 150
      Top = 25
      Width = 326
      Height = 21
      EditLabel.Width = 132
      EditLabel.Height = 21
      EditLabel.Caption = 'Filtrar por Nome do Cliente:'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = ''
    end
    object BBAtualizar: TBitBtn
      Left = 531
      Top = 5
      Width = 75
      Height = 42
      Anchors = [akTop, akRight]
      Caption = 'Filtra&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 3
      Images = DMUtils.ILImagensSystem
      ParentFont = False
      TabOrder = 2
      OnClick = BBAtualizarClick
      ExplicitLeft = 534
    end
  end
  object DSViewClientes: TDataSource
    DataSet = ClientesMemTable
    Left = 224
    Top = 160
  end
  object ClientesMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 332
    Top = 160
  end
end
