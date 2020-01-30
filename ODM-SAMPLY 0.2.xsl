<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
		
	<xsl:template match="/"> 
		<export xmlns="http://schema.samply.de/mdr/common">
		    <namespace uuid="5fd5d188-a5e5-4fa4-b4b3-753939a27eb2">
	    	    <definitions>
	        	    <definition lang="en" uuid="5fd5d188-a5e5-4fa4-b4b3-753939a27eb2">
	            	    <designation>ODM</designation>
	                	<definition>ODM</definition>
				</definition>
				</definitions>
				<name>ODM</name>
	    	</namespace>
			<xsl:for-each select="*/Study/MetaDataVersion/ItemDef">
				<xsl:call-template name="Type"></xsl:call-template>
			</xsl:for-each>
		</export>
	</xsl:template>

	<xsl:template name="Type" xmlns="http://schema.samply.de/mdr/common">
		<xsl:choose>
			<xsl:when test="@DataType = 'boolean'">
				<xsl:call-template name="Boolean"/>
			</xsl:when>
		 <xsl:when test="@DataType = 'float'">
				<xsl:call-template name="Float"/>
			</xsl:when>
			<xsl:when test="@DataType = 'integer'">
				<xsl:call-template name="Integer"/>
			</xsl:when>
			<xsl:when test="@DataType = 'date'">
				<xsl:call-template name="Date"/>
			</xsl:when>
			<xsl:when test="@DataType = 'text'">
				<xsl:call-template name="Text"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name = "Boolean" xmlns="http://schema.samply.de/mdr/common">
		<describedValueDomain uuid="">
			<format>(true|false|yes|no|f|t)</format>
			<datatype>BOOLEAN</datatype>
			<maxCharacter>5</maxCharacter>
			<description>(true|false|yes|no|f|t)</description>
			<validationType>BOOLEAN</validationType>
			<validationData>(true|false|yes|no|f|t)</validationData>
		</describedValueDomain>
		<dataElement>
			<valueDomain></valueDomain>
		</dataElement>
		<scopedIdentifier>
			<definitions>
			 	<xsl:call-template name="Definitions"/>
			</definitions>
			<xsl:call-template name="Slots"></xsl:call-template>
		</scopedIdentifier>
	</xsl:template>
	
	<xsl:template name = "Float" xmlns="http://schema.samply.de/mdr/common">
		<describedValueDomain uuid="">
			<format></format>
			<datatype>FLOAT</datatype>
			<maxCharacter>0</maxCharacter>
			<!-- Muss noch implementiert werden -->
			<unitOfMeasure></unitOfMeasure>
			<!-- <unitOfMeasure> -->
				<!-- <xsl:variable name="UnitOID">
					<xsl:value-of select="MeasurementUnitRef/@MeasurementUnitOID"/>
				</xsl:variable>
				 <unitOfMeasure> -->
				<!-- <xsl:call-template name="Einheiten" xmlns="http://schema.samply.de/mdr/common">
					<xsl:with-param name="Einheit" select="$UnitOID"></xsl:with-param>
				</xsl:call-template>
				<xsl:value-of select="*/Study/BasicDefinitions/@Name"></xsl:value-of> -->
				<!-- <xsl:apply-templates select="//BasicDefinitions[OID='MU.1']"/> -->
					<!-- <xsl:value-of select="MeasurementUnitRef/@MeasurementUnitOID"></xsl:value-of> -->
				<!--</unitOfMeasure> -->
				<!--  <xsl:call-template name="Einheit">
				 	<xsl:with-param name="Unit" select="$UnitOID"/> 
				</xsl:call-template>-->
			<!--  <xsl:value-of select="MeasurementUnitRef/@MeasurementUnitOID"/> --><!-- <xsl:value-of select="MeasurementUnitRef/@MeasurementUnitOID"></xsl:value-of> -->
			<!-- <xsl:call-template name="Measurement"></xsl:call-template> -->
			<!-- </unitOfMeasure> -->
			<description></description>
			<validationType>FLOATRANGE</validationType>
			<validationData></validationData>
		</describedValueDomain>
		<dataElement>
			<valueDomain></valueDomain>
		</dataElement>
		<scopedIdentifier>
			<definitions>
				<xsl:call-template name="Definitions"/>
			</definitions>
			<xsl:call-template name="Slots"></xsl:call-template>
		</scopedIdentifier>
	</xsl:template>
	
<!-- 	<xsl:template name = "Einheiten" xmlns="http://schema.samply.de/mdr/common">
		<xsl:param name="Einheit"></xsl:param>
		<xsl:for-each select="*/Study/BasicDefinitions/MeasurementUnit">
		<xsl:choose>
		<xsl:when test="@Name = 'MU.1'">
			<unitOfMeasure><xsl:value-of select="*/Study/BasicDefinitions/MeasurementUnit/@Name"></xsl:value-of></unitOfMeasure>
	</xsl:template> -->

	<xsl:template name = "Integer" xmlns="http://schema.samply.de/mdr/common">
		<describedValueDomain uuid="">
			<format></format>
			<datatype>INTEGER</datatype>
			<maxCharacter>0</maxCharacter>
			<unitOfMeasure></unitOfMeasure>
			<description></description>
			<validationType>INTEGERRANGE</validationType>
			<validationData></validationData>
		</describedValueDomain>
		<dataElement>
			<valueDomain></valueDomain>
		</dataElement>
		<scopedIdentifier>
			<definitions>
				<xsl:call-template name="Definitions"/>
			</definitions>
			<xsl:call-template name="Slots"></xsl:call-template>
		</scopedIdentifier>
	</xsl:template>
	
	<xsl:template name = "Datetime" xmlns="http://schema.samply.de/mdr/common">
		<describedValueDomain uuid="">
			<format>DD.MM.YYYY hh:mm:ss</format>
			<datatype>DATETIME</datatype>
			<maxCharacter>19</maxCharacter>
			<description>DD.MM.YYYY hh:mm:ss</description>
			<validationType>DATETIME</validationType>
			<validationData>DIN_5008_WITH_DAYS,HOURS_24_WITH_SECONDS</validationData>
		</describedValueDomain>
		<dataElement>
			<valueDomain></valueDomain>
		</dataElement>
		<scopedIdentifier>
			<definitions>
				<xsl:call-template name="Definitions"/>
			</definitions>
			<xsl:call-template name="Slots"></xsl:call-template>
		</scopedIdentifier>
	</xsl:template>
	
	<xsl:template name = "Date" xmlns="http://schema.samply.de/mdr/common">
		<describedValueDomain uuid="">
			<format>DD.MM.YYYY</format>
			<datatype>DATE</datatype>
			<maxCharacter>10</maxCharacter>
			<description>DD.MM.YYYY</description>
			<validationType>DATE</validationType>
			<validationData>DIN_5008_WITH_DAYS</validationData>
		</describedValueDomain>
		<dataElement>
			<valueDomain></valueDomain>
		</dataElement>
		<scopedIdentifier>
			<definitions>
				<xsl:call-template name="Definitions"/>
			</definitions>
			<xsl:call-template name="Slots"></xsl:call-template>
		</scopedIdentifier>
	</xsl:template>
	
		<xsl:template name = "Time" xmlns="http://schema.samply.de/mdr/common">
		<describedValueDomain uuid="">
			<format>hh:mm:ss</format>
			<datatype>TIME</datatype>
			<maxCharacter>8</maxCharacter>
			<description>hh:mm:ss</description>
			<validationType>TIME</validationType>
			<validationData>LOCAL_TIME_WITH_SECONDS</validationData>
		</describedValueDomain>
		<dataElement>
			<valueDomain></valueDomain>
		</dataElement>
		<scopedIdentifier>
			<definitions>
				<definition lang="{Question/TranslatedText/@xml:lang}" uuid="">
					<designation><xsl:value-of select="@Name"/></designation>
					<definition><xsl:value-of select="Question/TranslatedText"/></definition>
				</definition>
			</definitions>
			<xsl:call-template name="Slots"></xsl:call-template>
		</scopedIdentifier>
	</xsl:template>
	
	
	<xsl:template name = "Text" xmlns="http://schema.samply.de/mdr/common">
		<describedValueDomain uuid="">
			<format></format>
			<datatype>STRING</datatype>
			<maxCharacter>0</maxCharacter>
			<description></description>
			<validationType></validationType>
			<validationData></validationData>
		</describedValueDomain>
		<dataElement>
			<valueDomain></valueDomain>
		</dataElement>
		<scopedIdentifier>
			<definitions>
				<xsl:call-template name="Definitions"/>
			</definitions>
			<xsl:call-template name="Slots"/>
		</scopedIdentifier>
	</xsl:template>
	
	<!-- Momentan nimmt er in die definition sowohl die deutsche, als auch die englische Beschreibung -->
	<xsl:template name = "Definitions" xmlns="http://schema.samply.de/mdr/common">
		
			<definition lang="de" uuid="">
				<designation><xsl:value-of select="@Name"/></designation>
				<definition><xsl:value-of select="Question/TranslatedText[@xml:lang='de']"/></definition>
			</definition>
		
		<definition lang="en" uuid="">
		
				<designation><xsl:value-of select="@Name"/></designation>
				<definition><xsl:value-of select="Question/TranslatedText[@xml:lang='en']"/></definition>
		
		</definition>
	</xsl:template>

	<!-- Müssen noch implementiert werden -->
	<xsl:template name="Slots" xmlns="http://schema.samply.de/mdr/common">
		<slots>
			<slot>
				<key>Quellsystem_Dokumentationsanteil</key>
				<value></value>
			</slot>
			<slot>
				<key>Quellsystem_Betreibende_Organisationseinheit</key>
				<value></value>
			</slot>
			<slot>
				<key>Quellsystem_Hersteller_Produkt_Version</key>
				<value></value>
			</slot>
			<slot>
				<key>Quellsystem_Typ</key>
				<value></value>
			</slot>
			<slot>
				<key>Relevanz_fuer_Datensatz_ID</key>
				<value></value>
			</slot>
		</slots>
		<namespace></namespace>
		<identifier></identifier>
		<version></version>
		<element></element>
		<status></status>
	</xsl:template>



</xsl:stylesheet>
