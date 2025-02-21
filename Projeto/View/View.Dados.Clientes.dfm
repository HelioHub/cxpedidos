object FDadosClientes: TFDadosClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados do Cliente'
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
  TextHeight = 13
  object PRodape: TPanel
    Left = 0
    Top = 293
    Width = 599
    Height = 41
    Align = alBottom
    TabOrder = 1
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
      Left = 384
      Top = 6
      Width = 121
      Height = 25
      Hint = 'Grava Pedido e seus Itens.'
      Anchors = [akRight]
      Caption = '&Gravar Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 5
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BBGravarClick
    end
  end
  object PDados: TPanel
    Left = 0
    Top = 0
    Width = 599
    Height = 293
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    object SBF2: TSpeedButton
      Left = 175
      Top = 37
      Width = 107
      Height = 22
      Caption = 'F2 -Concultar CNPJ'
      StyleName = 'Windows'
      OnClick = SBF2Click
    end
    object LNomeFant: TLabel
      Left = 28
      Top = 158
      Width = 75
      Height = 13
      Caption = 'Nome Fantasia:'
    end
    object LEnd: TLabel
      Left = 54
      Top = 182
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object LNum: TLabel
      Left = 62
      Top = 206
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object LBairro: TLabel
      Left = 71
      Top = 230
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object LLong: TLabel
      Left = 473
      Top = 159
      Width = 51
      Height = 13
      Caption = 'Longitude:'
    end
    object LLati: TLabel
      Left = 481
      Top = 182
      Width = 43
      Height = 13
      Caption = 'Latitude:'
    end
    object LCIBGE: TLabel
      Left = 446
      Top = 206
      Width = 78
      Height = 13
      Caption = 'Codigo do IBGE:'
    end
    object LSituacao: TLabel
      Left = 428
      Top = 230
      Width = 96
      Height = 13
      Caption = 'Situa'#231#227'o do Cliente:'
    end
    object Label1: TLabel
      Left = 28
      Top = 138
      Width = 64
      Height = 13
      Caption = 'Raz'#227'o Social:'
    end
    object LECodigoCliente: TLabeledEdit
      Left = 108
      Top = 10
      Width = 61
      Height = 21
      EditLabel.Width = 88
      EditLabel.Height = 21
      EditLabel.Caption = 'C'#243'digo do Cliente:'
      Enabled = False
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
      Text = ''
    end
    object LabeledEdit1: TLabeledEdit
      Left = 108
      Top = 37
      Width = 61
      Height = 21
      EditLabel.Width = 88
      EditLabel.Height = 21
      EditLabel.Caption = 'C'#243'digo do Cliente:'
      Enabled = False
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 1
      Text = ''
    end
  end
end
