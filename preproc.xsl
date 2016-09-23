<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output
		cdata-section-elements="book"
		indent="yes"
		encoding="UTF-8"
		/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="//*[local-name() = 'refmeta']">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
			<xsl:if test="not(refmiscinfo[@class='manual'])">
				<refmiscinfo class="manual" xmlns="http://docbook.org/ns/docbook">OpenGL Manual</refmiscinfo>
			</xsl:if>
			<xsl:if test="not(refmiscinfo[@class='source'])">
				<refmiscinfo class="source" xmlns="http://docbook.org/ns/docbook">opengl.org</refmiscinfo>
			</xsl:if>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="//*[local-name() = 'refsect1' and @xml:id = 'versions']" />

	<!--
	<xsl:template match="//*[local-name() = 'info']">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
			<xsl:if test="not(author)">
				<author xmlns="http://docbook.org/ns/docbook"><surname xmlns="http://docbook.org/ns/docbook">Khronos Group</surname></author>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
	-->
</xsl:stylesheet>
