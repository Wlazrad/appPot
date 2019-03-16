package andrzej.appdemo.entityexp;


import andrzej.appdemo.comment.Comment;
import andrzej.appdemo.user.User;
import lombok.ToString;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import java.util.Collection;

import static org.eclipse.jdt.internal.compiler.codegen.ConstantPool.ToString;

@Entity
@Table(name = "expert", schema = "mojabaza")
public class Expert {



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotNull
    @Column(name = "name")
    private String name;

    @NotNull
    @Column(name = "location")
    private int location;

    @NotNull
    @Column(name = "job")
    private String job;

    @NotNull
    @Column(name = "details")
    private String details;

    @NotNull
    @Column(name = "image_url")
    private String image_url;

    @NotNull
    @Column(name = "number")
    private int number;

    @ToString.Exclude
    @OneToMany(mappedBy = "expert", cascade = CascadeType.ALL)
    @Fetch(FetchMode.JOIN)
    private Collection<Comment> comments;

    public Expert() {}

    public Expert(String name, int location, String job, String details, String image_url, int number) {
        this.name = name;
        this.location = location;
        this.job = job;
        this.details = details;
        this.image_url = image_url;
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLocation() {
        return location;
    }

    public void setLocation(int location) {
        this.location = location;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> comments) {
        this.comments = comments;
    }


}
