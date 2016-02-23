class zish_n1vkg_utils definition
  public
  final
  create public .

  public section.

    "Obtiene el n1vkg a partir de vkgid
    class-methods get_n1vkg
      importing
        value(p_vkgid) type n1vkg-vkgid
      exporting
        value(p_n1vkg) type n1vkg
      exceptions
        vkgid_not_found
        not_implemented
     .

    "Obtiene el npat a partir del vkgid
    class-methods jump_2_npat
      importing
        value(p_vkgid) type n1vkg-vkgid
      exporting
        value(p_npat)  type npat
      exceptions
        vkgid_not_found
        npat_not_found
        not_implemented
      .

    "Obtiene el ntmn a partir del vkgid
    class-methods jump_2_ntmn
      importing
        value(p_vkgid) type n1vkg-vkgid
      exporting
        value(p_ntmn)  type ntmn
      exceptions
        vkgid_not_found
        ntmn_not_found
        not_implemented
      .

      "Obtiene el n1corder a partir del vkgid
    class-methods jump_2_n1corder
      importing
        value(p_vkgid)    type n1vkg-vkgid
      exporting
        value(p_n1corder) type n1corder
      exceptions
        vkgid_not_found
        n1corder_not_found
        not_implemented
      .

    "Obtiene el vkgid a partir del vkgid
    class-methods prgnr_2_vkgid
      importing
        value(p_prgnr) type n1vkg-prgnr
      exporting
        value(p_vkgid) type n1vkg-vkgid
      exceptions
        vkgid_not_found
        not_implemented
      .

      "Obtiene el nbew a partir del vkgid
      class-methods jump_2_nbew
      importing
        value(p_vkgid) type n1vkg-vkgid
        exporting
          value(p_nbew) type nbew
      exceptions
        vkgid_not_found
        nbew_not_found
        not_implemented
        .

      "Obtiene el nlei a partir del vkgid
      class-methods jump_2_nlei
      importing
        value(p_vkgid) type n1vkg-vkgid
        exporting
          value(p_nlei) type nlei
      exceptions
        vkgid_not_found
        nlei_not_found
        not_implemented
        .

      "Obtiene el nlem a partir del vkgid
      class-methods jump_2_nlem
      importing
        value(p_vkgid) type n1vkg-vkgid
        exporting
          value(p_nlem) type nlem
      exceptions
        vkgid_not_found
        nlem_not_found
        not_implemented
        .

      "Obtiene el npob a partir del vkgid (para obtener el empleado asociado a una agenda)
      class-methods jump_2_npob
        importing value(p_vkgid) type n1vkg-vkgid
        exporting value(p_npob) type npob
        exceptions
          vkgid_not_found
          ntmn_not_found
          napp_not_found
          npob_not_found
          not_implemented
          .

  protected section.
  private section.
ENDCLASS.



CLASS ZISH_N1VKG_UTILS IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>GET_N1VKG
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_VKGID                        TYPE        N1VKG-VKGID
* | [<---] P_N1VKG                        TYPE        N1VKG
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_n1vkg.
    "data: l_n1vkg type n1vkg.
    "select single apcnid from n1vkg into l_apcnid where vkgid = p_vkgid.
    "select single * from ntmn into p_ntmn where apcnid = l_apcnid.

    select single * from n1vkg into p_n1vkg where vkgid = p_vkgid.
    if sy-subrc <> 0.
      raise vkgid_not_found.
    endif.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>JUMP_2_N1CORDER
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_VKGID                        TYPE        N1VKG-VKGID
* | [<---] P_N1CORDER                     TYPE        N1CORDER
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] N1CORDER_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method jump_2_n1corder.
    data: l_corderid type n1vkg-corderid.

    select single corderid from n1vkg into l_corderid where vkgid = p_vkgid.
    if sy-subrc <> 0.
      raise vkgid_not_found.
    endif.
    select single * from n1corder into p_n1corder where corderid = l_corderid.
    if sy-subrc <> 0.
      raise n1corder_not_found.
    endif.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>JUMP_2_NBEW
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_VKGID                        TYPE        N1VKG-VKGID
* | [<---] P_NBEW                         TYPE        NBEW
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] NBEW_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method jump_2_nbew.

    raise not_implemented.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>JUMP_2_NLEI
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_VKGID                        TYPE        N1VKG-VKGID
* | [<---] P_NLEI                         TYPE        NLEI
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] NLEI_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method jump_2_nlei.

   raise not_implemented.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>JUMP_2_NLEM
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_VKGID                        TYPE        N1VKG-VKGID
* | [<---] P_NLEM                         TYPE        NLEM
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] NLEM_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
    method jump_2_nlem.

   raise not_implemented.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>JUMP_2_NPAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_VKGID                        TYPE        N1VKG-VKGID
* | [<---] P_NPAT                         TYPE        NPAT
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] NPAT_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method jump_2_npat.
    data: l_patnr type n1vkg-patnr.

    select single patnr from n1vkg into l_patnr where vkgid = p_vkgid.
    if sy-subrc <> 0.
      raise vkgid_not_found.
    endif.
    select single * from npat into p_npat where patnr = l_patnr.
    if sy-subrc <> 0.
      raise npat_not_found.
    endif.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>JUMP_2_NPOB
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_VKGID                        TYPE        N1VKG-VKGID
* | [<---] P_NPOB                         TYPE        NPOB
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] NTMN_NOT_FOUND
* | [EXC!] NAPP_NOT_FOUND
* | [EXC!] NPOB_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method jump_2_npob.
    data:  l_pobnr  type napp-pobnr
           ,l_orgpf type napp-orgpf
           ,l_orgfa type napp-orgfa
          ,l_tmnid   type ntmn-tmnid
          ,l_apcnid  type n1vkg
          .



      select single apcnid from n1vkg into l_apcnid where vkgid = p_vkgid.
      if sy-subrc <> 0.
          raise vkgid_not_found.
      endif.

      select single tmnid from ntmn into l_tmnid where apcnid = l_apcnid.
        if sy-subrc <> 0.
          raise ntmn_not_found.
        endif.

      "Obtengo el pobnr y el orgid para obtener la agenda de la citacion.
      select single pobnr orgpf orgfa from napp into (l_pobnr,l_orgpf,l_orgfa) where lnrapp = l_tmnid.
        if sy-subrc <> 0.
          raise napp_not_found.
          endif.

      "select single pernr bauid from npob into (campo_etrgp,l_bauid) where pobnr = l_pobnr and orgid = l_orgpf.
      select single * from npob into p_npob where pobnr = l_pobnr and orgid = l_orgpf.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>JUMP_2_NTMN
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_VKGID                        TYPE        N1VKG-VKGID
* | [<---] P_NTMN                         TYPE        NTMN
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] NTMN_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method jump_2_ntmn.
    data: l_apcnid type n1vkg-apcnid.

    select single apcnid from n1vkg into l_apcnid where vkgid = p_vkgid.
    if sy-subrc <> 0.
      raise vkgid_not_found.
    endif.
    select single * from ntmn into p_ntmn where apcnid = l_apcnid.
    if sy-subrc <> 0.
      raise ntmn_not_found.
    endif.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZISH_N1VKG_UTILS=>PRGNR_2_VKGID
* +-------------------------------------------------------------------------------------------------+
* | [--->] P_PRGNR                        TYPE        N1VKG-PRGNR
* | [<---] P_VKGID                        TYPE        N1VKG-VKGID
* | [EXC!] VKGID_NOT_FOUND
* | [EXC!] NOT_IMPLEMENTED
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method prgnr_2_vkgid.
    "data: l_n1vkg type n1vkg.
    "select single apcnid from n1vkg into l_apcnid where vkgid = p_vkgid.
    "select single * from ntmn into p_ntmn where apcnid = l_apcnid.

    select single vkgid from n1vkg into p_vkgid where prgnr = p_prgnr.
    if sy-subrc <> 0.
      raise vkgid_not_found.
    endif.
  endmethod.
ENDCLASS.