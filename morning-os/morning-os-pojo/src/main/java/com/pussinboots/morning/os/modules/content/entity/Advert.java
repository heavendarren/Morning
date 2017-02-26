package com.pussinboots.morning.os.modules.content.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：Advert   
* 类描述：Advert 表 / 广告位表 实体类    
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:14:14   
*
 */
@TableName("os_advert")
public class Advert extends Model<Advert> {

    private static final long serialVersionUID = 1L;

    /**
     * 广告位ID
     */
	@TableId("advert_id")
	private Long advertId;
    /**
     * 名称
     */
	private String name;
    /**
     * 宽度
     */
	private Integer width;
    /**
     * 高度
     */
	private Integer height;
    /**
     * 描述
     */
	private String description;
    /**
     * 代码简称
     */
	private String code;
    /**
     * 模版内容
     */
	private String template;
    /**
     * 默认显示个数
     */
	@TableField("defult_number")
	private Integer defultNumber;


	public Long getAdvertId() {
		return advertId;
	}

	public void setAdvertId(Long advertId) {
		this.advertId = advertId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public Integer getDefultNumber() {
		return defultNumber;
	}

	public void setDefultNumber(Integer defultNumber) {
		this.defultNumber = defultNumber;
	}

	@Override
	protected Serializable pkVal() {
		return this.advertId;
	}

}
