package com.iitms.rfcampusdata.authentication.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "ua_society_master")
public class Society {

    @Transient
    private String call;

    @Transient
    private String modIds;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "soc_id", columnDefinition = "serial")
    private int socId;

    @Column(name = "soc_code")
    private String socCode;

    @Column(name = "soc_name")
    private String socName;

    @Column(name = "soc_regno")
    private String socRegno;

    @Column(name = "soc_logo")
    private String socLogo;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "society_chairman")
    private String societyChairman;

    @Column(name = "society_secretory")
    private String societySecretory;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "create_dt")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date createDt;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_dt")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date modifiedDt;

    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinTable(name = "ua_add_master", joinColumns = @JoinColumn(name = "soc_id", updatable = true, insertable = true) , inverseJoinColumns = @JoinColumn(name = "addid") )
    private AddressMaster addressMaster;

    public Society(int socId, String socCode, String socName, String socRegno, String socLogo, String ipAddress,
        String macAddress, String societyChairman, String societySecretory, int createdBy, Date createDt,
        int modifiedBy, Date modifiedDt) {
        super();
        this.socId = socId;
        this.socCode = socCode;
        this.socName = socName;
        this.socRegno = socRegno;
        this.socLogo = socLogo;
        this.ipAddress = ipAddress;
        this.macAddress = macAddress;
        this.societyChairman = societyChairman;
        this.societySecretory = societySecretory;
        this.createdBy = createdBy;
        this.createDt = createDt;
        this.modifiedBy = modifiedBy;
        this.modifiedDt = modifiedDt;
    }

    public String getCall() {
        return call;
    }

    public void setCall(String call) {
        this.call = call;
    }

    public AddressMaster getAddressMaster() {
        return addressMaster;
    }

    public void setAddressMaster(AddressMaster addressMaster) {
        this.addressMaster = addressMaster;
    }

    public int getSocId() {
        return socId;
    }

    public void setSocId(int socId) {
        this.socId = socId;
    }

    public String getSocCode() {
        return socCode;
    }

    public void setSocCode(String socCode) {
        this.socCode = socCode;
    }

    public String getSocName() {
        return socName;
    }

    public void setSocName(String socName) {
        this.socName = socName;
    }

    public String getSocRegno() {
        return socRegno;
    }

    public void setSocRegno(String socRegno) {
        this.socRegno = socRegno;
    }

    public String getSocLogo() {
        return socLogo;
    }

    public void setSocLogo(String socLogo) {
        this.socLogo = socLogo;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getMacAddress() {
        return macAddress;
    }

    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
    }

    public String getSocietyChairman() {
        return societyChairman;
    }

    public void setSocietyChairman(String societyChairman) {
        this.societyChairman = societyChairman;
    }

    public String getSocietySecretory() {
        return societySecretory;
    }

    public void setSocietySecretory(String societySecretory) {
        this.societySecretory = societySecretory;
    }

    public int getCreateBy() {
        return createdBy;
    }
    // code -1
    // .print(e);
    // }
    // }

    // code-2
    // .print(e);
    // }

    // }

    @Override
    public String toString() {
        return "Society [socId=" + socId + ", socCode=" + socCode + ", socName=" + socName + ", socRegno=" + socRegno
            + ", socLogo=" + socLogo + ", ipAddress=" + ipAddress + ", macAddress=" + macAddress + ", societyChairman="
            + societyChairman + ", societySecretory=" + societySecretory + ", createBy=" + createdBy + ", createDt="
            + createDt + ", modifiedBy=" + modifiedBy + ", modifiedDt=" + modifiedDt + "]";
    }

    public String getModIds() {
        return modIds;
    }

    public void setModIds(String modIds) {
        this.modIds = modIds;
    }

    public void setProperties(String socCode, String socName, String socRegno, String socLogo, String ipAddress,
        String macAddress, String societyChairman, String societySecretory, int modifiedBy, Date modifiedDt) {
        this.socCode = socCode;
        this.socName = socName;
        this.socRegno = socRegno;
        this.socLogo = socLogo;
        this.ipAddress = ipAddress;
        this.macAddress = macAddress;
        this.societyChairman = societyChairman;
        this.societySecretory = societySecretory;
        this.modifiedBy = modifiedBy;
        this.modifiedDt = modifiedDt;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((socCode == null) ? 0 : socCode.hashCode());
        result = prime * result + socId;
        result = prime * result + ((socLogo == null) ? 0 : socLogo.hashCode());
        result = prime * result + ((socName == null) ? 0 : socName.hashCode());
        result = prime * result + ((socRegno == null) ? 0 : socRegno.hashCode());
        result = prime * result + ((societyChairman == null) ? 0 : societyChairman.hashCode());
        result = prime * result + ((societySecretory == null) ? 0 : societySecretory.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        Society other = (Society) obj;
        if (socCode == null) {
            if (other.socCode != null) {
                return false;
            }
        } else if (!socCode.equals(other.socCode)) {
            return false;
        }
        if (socId != other.socId) {
            return false;
        }
        if (socLogo == null) {
            if (other.socLogo != null) {
                return false;
            }
        } else if (!socLogo.equals(other.socLogo)) {
            return false;
        }
        if (socName == null) {
            if (other.socName != null) {
                return false;
            }
        } else if (!socName.equals(other.socName)) {
            return false;
        }
        if (socRegno == null) {
            if (other.socRegno != null) {
                return false;
            }
        } else if (!socRegno.equals(other.socRegno)) {
            return false;
        }
        if (societyChairman == null) {
            if (other.societyChairman != null) {
                return false;
            }
        } else if (!societyChairman.equals(other.societyChairman)) {
            return false;
        }
        if (societySecretory == null) {
            if (other.societySecretory != null) {
                return false;
            }
        } else if (!societySecretory.equals(other.societySecretory)) {
            return false;
        }
        return true;
    }

    public Society() {
        super();
    }

}
