CLASS zcl_01_log_c367_agr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS set_attr IMPORTING iv_attr TYPE string.
    METHODS get_attr EXPORTING ev_attr TYPE string.

    CLASS-METHODS set_attr2 IMPORTING iv_attr TYPE string.
    CLASS-METHODS get_attr2 EXPORTING ev_attr TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: my_attr TYPE string.
    CLASS-DATA: my_attr2 TYPE string.
ENDCLASS.



CLASS zcl_01_log_c367_agr IMPLEMENTATION.
  METHOD set_attr.

  ENDMETHOD.

  METHOD set_attr2.

  ENDMETHOD.

  METHOD get_attr.

  ENDMETHOD.

  METHOD get_attr2.

  ENDMETHOD.

ENDCLASS.
