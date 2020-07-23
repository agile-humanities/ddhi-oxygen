<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jun 13, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="root">
        <listPlace>
            <xsl:apply-templates />
        </listPlace>
    </xsl:template>
    
    <xsl:template match="row">
        <place xml:id="{id}">
            
            <placeName>
                <xsl:value-of select="placeName"/>
            </placeName>
            <location>
                <geo>
                    <xsl:value-of select="replace(coordinate_location, ',',' ')"/>
                </geo>
            </location>
            <idno type="WD"><xsl:value-of select="QID"/></idno>
        </place>
    </xsl:template>
    
</xsl:stylesheet>