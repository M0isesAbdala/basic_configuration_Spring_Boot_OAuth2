package abdala.authentication.entities;

import com.fasterxml.jackson.annotation.JsonValue;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING)
    @Column(unique = true)
    private Roles name;

    public Role(Roles role) {
        this.id = role.getRoleId();
        this.name = role;
    }

    public Roles getName() {
        return name;
    }

    public void setName(Roles name) {
        this.name = name;
        this.id = name.getRoleId();
    }

    public Long getId() {
        return id;
    }

    @JsonValue
    public String jsonValue() {
        return name.name();
    }

    @Getter
    public enum Roles {

        ADMIN(1L),
        USER(2L);

        final long roleId;

        Roles(long roleId) {
            this.roleId = roleId;
        }

    }
}
