<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${objectName}Mapper">


    <!-- 新增-->
    <insert id="save" parameterType="${pack}">
        insert into ${table}(
	<#list fieldList as var>
        ${var},
    </#list>
    ${id}
        ) values (
	<#list fieldList as var>
        ${r"#{"}${var}${r"}"},
    </#list>
    ${r"#{"}${id}${r"}"}
        )
    </insert>


    <!-- 删除-->
    <delete id="delete" parameterType="${pack}">
        delete from ${table}
        where
    ${id} = ${r"#{"}${id}${r"}"}
    </delete>


    <!-- 修改 -->
    <update id="edit" parameterType="${pack}">
        update  ${table}
        set
	<#list fieldList as var>
        <#if var??>
            ${var} = ${r"#{"}${var}${r"}"},
        </#if>
    </#list>
        where
    ${id} = ${r"#{"}${id}${r"}"}
    </update>


    <!-- 通过ID获取数据 -->
    <select id="findById" parameterType="java.lang.String" resultType="${pack}">
        select
	<#list fieldList as var>
        ${var},
    </#list>
    ${id}
        from
    ${table}
        where
    ${id} = ${r"#{"}${id}${r"}"}
    </select>

    <!-- 列表(全部) -->
    <select id="listAll"  resultType="${pack}">
        select
		<#list fieldList as var>
				a.${var},
        </#list>
        a.${id}
        from
    ${table} a
    </select>

</mapper>
