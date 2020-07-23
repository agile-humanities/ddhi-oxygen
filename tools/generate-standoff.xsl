<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="3.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>


    <xsl:variable name="standOff">
        <standOff xmlns="http://www.tei-c.org/ns/1.0">
            <listPlace>
                <xsl:for-each
                    select="distinct-values(root()//tei:u//(tei:name[@type = 'place'] | tei:placeName))">
                    <xsl:variable name="id">
                        <xsl:value-of select="concat('place', position())"/>
                    </xsl:variable>
                    <place xml:id="{$id}">
                        <placeName>
                            <xsl:value-of select="current()"/>
                        </placeName>
                    </place>
                </xsl:for-each>
            </listPlace>
            <listPerson>
                <xsl:for-each
                    select="distinct-values(root()//tei:u//(tei:name[@type = 'person'] | tei:persName))">
                    <xsl:variable name="id">
                        <xsl:value-of select="concat('person', position())"/>
                    </xsl:variable>
                    <person xml:id="{$id}">
                        <persName>
                            <xsl:value-of select="current()"/>
                        </persName>
                    </person>
                </xsl:for-each>
            </listPerson>
            <listOrg>
                <xsl:for-each
                    select="distinct-values(root()//tei:u//(tei:name[@type = 'org'] | tei:orgName))">
                    <xsl:variable name="id">
                        <xsl:value-of select="concat('org', position())"/>
                    </xsl:variable>
                    <org xml:id="{$id}">
                        <orgName>
                            <xsl:value-of select="current()"/>
                        </orgName>
                    </org>
                </xsl:for-each>
            </listOrg>
            <listEvent>
                <xsl:for-each
                    select="distinct-values(root()//tei:u//(tei:name[@type = 'event'] | tei:eventName))">
                    <xsl:variable name="id">
                        <xsl:value-of select="concat('event', position())"/>
                    </xsl:variable>
                    <event xml:id="{$id}">
                        <desc>
                            <xsl:value-of select="current()"/>
                        </desc>
                    </event>
                </xsl:for-each>
            </listEvent>
        </standOff>
    </xsl:variable>

    <xsl:template match="tei:TEI">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
            <xsl:copy-of select="$standOff"/>
        </TEI>
    </xsl:template>

    <xsl:template match="tei:placeName">
        <xsl:variable name="id">
            <xsl:value-of
                select="$standOff//tei:placeName[current() = .]/ancestor::tei:place/@xml:id"/>
        </xsl:variable>
        <name xmlns="http://www.tei-c.org/ns/1.0" type="place" ref="{concat('#', $id)}">
            <xsl:apply-templates/>
        </name>
    </xsl:template>
    
    <xsl:template match="tei:persName | tei:name[@type='person']">
        <xsl:variable name="id">
            <xsl:value-of
                select="$standOff//tei:persName[current() = .]/ancestor::tei:person/@xml:id"/>
        </xsl:variable>
        <name xmlns="http://www.tei-c.org/ns/1.0" type="person" ref="{concat('#', $id)}">
            <xsl:apply-templates/>
        </name>
    </xsl:template>
    
    <xsl:template match="tei:orgName | tei:name[@type='org']">
        <xsl:variable name="id">
            <xsl:value-of
                select="$standOff//tei:orgName[current() = .]/ancestor::tei:org/@xml:id"/>
        </xsl:variable>
        <name xmlns="http://www.tei-c.org/ns/1.0" type="org" ref="{concat('#', $id)}">
            <xsl:apply-templates/>
        </name>
    </xsl:template>
    
    <xsl:template match="tei:eventName | tei:name[@type='event']">
        <xsl:variable name="id">
            <xsl:value-of
                select="$standOff//tei:desc[current() = .]/ancestor::tei:event/@xml:id"/>
        </xsl:variable>
        <name xmlns="http://www.tei-c.org/ns/1.0" type="event" ref="{concat('#', $id)}">
            <xsl:apply-templates/>
        </name>
    </xsl:template>

</xsl:stylesheet>
