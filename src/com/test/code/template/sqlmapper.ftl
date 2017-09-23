<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basePackage}.dao.${className}DAO" >
  
  <resultMap type="${basePackage}.pojo.${className}"           id="${pojoName}Result" >
     <#list list as item>
        <result column="${item.columnName}" property="${item.beanLable}"  />
     </#list>   
  </resultMap>
   
  <!-- 所有字段 -->
  <sql id="allColumns">
      <![CDATA[
	      <#list list as item>
	        t.${item.columnName} <#if item_has_next>,</#if>
	      </#list>
      ]]>
  </sql>
  
  <sql id="querySql">
     <where>
		    <#list list as item>
			<if test="params!=null and params.${item.beanLable} != null and params.${item.beanLable} != ''">
				and t.${item.columnName} = ${r"#{params."}${item.beanLable}${r"}"}
			</if>
			</#list>  
		</where>
  </sql>
  
    <select id="queryRowCount" parameterType="Map" resultType="long">
		select count(*)  from ${tableName} t <include refid="querySql"/>
	</select>

	<select id="queryByPage" resultMap="${pojoName}Result" parameterType="Map">
		select <include refid="allColumns"/> from ${tableName} t <include refid="querySql"/>
	</select>
	
	<select id="queryAll" resultMap="${pojoName}Result" parameterType="Map">
		select <include refid="allColumns"/> from ${tableName} t  <include refid="querySql"/>
	</select>
	
	<select id="queryByParam" resultMap="${pojoName}Result" parameterType="Map">
		select <include refid="allColumns"/> from ${tableName} t  <include refid="querySql"/>
	</select>
	
	<select id="queryById" resultMap="${pojoName}Result" parameterType="Map">
		select <include refid="allColumns"/> from ${tableName} t  
		<#list list as item>
		     <#if item_index == 0 >
         WHERE ${item.columnName}=${r"#{"} ${item.beanLable} ${r"}"}
               <#break>
              </#if>
	     </#list>
	</select>
	
  
   <!-- 保存 -->
   <insert id="save">
     INSERT INTO ${tableName} 
      (
        <trim suffix=" " suffixOverrides=","> <!-- 如果结尾为,替换为空格 -->
           <#list list as item>
	        <if test="${item.beanLable} != null">${item.columnName},</if>
	       </#list>
        </trim>
      ) 
      VALUES 
      (
        <trim suffix=" " suffixOverrides=",">
          <#list list as item>
		    <if test="${item.beanLable} != null">${r"#{"} ${item.beanLable} ${r"}"},</if>
		  </#list>  
	    </trim>
	  )
	</insert>
	
	<!-- 更新 -->
   <update id="update">
           UPDATE ${tableName} 
		   <set>
		   <#list list as item>
		     <#if item_index != 0>
		        <if test="${item.beanLable} != null">${item.columnName}=${r"#{"} ${item.beanLable} ${r"}"},</if>
		     </#if>
		   </#list> 
           </set>
       <#list list as item>
		     <#if item_index == 0 >
            WHERE ${item.columnName}=${r"#{"} ${item.beanLable} ${r"}"}
               <#break>
              </#if>
	    </#list> 
   </update>
   
   <delete id="delete">
   		delete from ${tableName}
		<#list list as item>
		     <#if item_index == 0 >
            WHERE ${item.columnName}=${r"#{"} ${item.beanLable} ${r"}"}
               <#break>
              </#if>
	    </#list> 
   </delete>
</mapper>