package andrzej.appdemo.entityexp;


import andrzej.appdemo.user.User;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import static org.eclipse.jdt.internal.compiler.codegen.ConstantPool.ToString;

@Entity
@Table(name = "expert", schema = "mojabaza")
public class Expert {

    public Expert() {}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "expert_id")
    private int id;

    @NotNull
    @Column(name = "job")
    private String job;

    @NotNull
    @Column(name = "years")
    private int years;

    @NotNull
    @Column(name = "location")
    private String location;

    @NotNull
    @Column(name = "project")
    private String project;

//    @OneToOne(mappedBy = "expert")
//    @Column(name = "user")
//    private User user;



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getYears() {
        return years;
    }

    public void setYears(int years) {
        this.years = years;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public Expert(@NotNull String job, @NotNull int years, @NotNull String location, @NotNull String project) {
        this.job = job;
        this.years = years;
        this.location = location;
        this.project = project;
    }
}
