with
    fonte_creditcard as (
        select 
        cast (creditcardid as int) as id_cartao_de_credito
        , cast (cardtype as string) as tipo_de_cartao
        , cast (cardnumber as string) as numero_do_cartao
        , cast (expmonth as string) as gasto_mensal
        , cast (expyear as string) as ano_expedicao
        --, cast (modifieddate* as string) as 
        from {{ source('erp', 'creditcard') }}
    )

    select *
    from fonte_creditcard
