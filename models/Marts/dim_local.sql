with
    stg_address as (
        select *
        from {{ ref('stg_erp__address') }}
    )

    ,int_endereco as (
        select *
        from {{ ref('int_erp__enderecos') }}
    )

    ,join_tabelas as (
        select
        stg_address.id_endereco
        , stg_address.id_estado
        , int_endereco.sk_estado_provincia
        , int_endereco.id_territorio
        , stg_address.rua
        , stg_address.rua_1
        , stg_address.cidade
        , stg_address.codigo_postal
        , int_endereco.codigo_estado_provincia
        , int_endereco.nome_estado_provincia
        , int_endereco.Codigo_pais_regiao
        , int_endereco.nome_do_pais_regiao
        , stg_address.chave
        from stg_address
        left join int_endereco on
        stg_address.id_estado = int_endereco.id_estado
    )
    ,criar_chaves as (
        select  
        row_number() over(order by id_endereco) as pk_endereco
        ,*
        from join_tabelas
    )
    select *
    from criar_chaves

